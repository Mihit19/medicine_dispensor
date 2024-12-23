
import 'package:apptofiretorasbpi/common/widgets/loader/loader.dart';
import 'package:apptofiretorasbpi/data/repositories/authentication/authentication_repository.dart';
import 'package:apptofiretorasbpi/data/repositories/data/user_repository.dart';
import 'package:apptofiretorasbpi/features/authentication/screens/login/login.dart';
import 'package:apptofiretorasbpi/features/personalization/screens/profile/widgets/re_authentication_user_login_form.dart';
import 'package:apptofiretorasbpi/utils/constants/image_strings.dart';
import 'package:apptofiretorasbpi/utils/constants/sizes.dart';
import 'package:apptofiretorasbpi/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  final imageUploading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  ///Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  ///save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      //Refresh User Record
      await fetchUserRecord();

      if (user.value.id.isEmpty){
        if (userCredential != null) {
          //convert Name to First and Last name
          final nameParts =
          UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username =
          UserModel.generateUsername(userCredential.user!.displayName ?? '');

          //Map data
          final user = UserModel(
              id: userCredential.user!.uid,
              username: username,
              email: userCredential.user!.email ?? '',
              firstName: nameParts[0],
              lastName:
              nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePicture: userCredential.user!.photoURL ?? '');

          // save user data
          await userRepository.saveUserRecord(user);
        }
      }

    } catch (e) {
      EELoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. you can re-save your date in your profile');
    }
  }

  ///Delete Account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(EESizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to delete your account permanently? This action is not reversible and all of data will be removed permanently.',
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: EESizes.lg),
                child: Text('Delete'))),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')
        )
    );
  }
  
  /// Delete user account
  void deleteUserAccount() async {
    try {
      EEFullScreenLoader.openLoadingDialogue(
          'Processing', EEImage.processingAnimation);

      ///First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!
          .providerData
          .map((e) => e.providerId)
          .first;
      if (provider.isNotEmpty) {
        //re verify auth email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          EEFullScreenLoader.stopLoading();
          Get.to(() => const LoginScreen());
        } else if (provider == 'password') {
          EEFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      EEFullScreenLoader.stopLoading();
      EELoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
  /// RE_AUTHENTICATE before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async{
    try{
      //start loading
      EEFullScreenLoader.openLoadingDialogue(
          'Processing', EEImage.processingAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EEFullScreenLoader.stopLoading();
        return;
      }

      //Form validation
      if (!reAuthFormKey.currentState!.validate()) {
        EEFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      EEFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    }catch(e){
      EEFullScreenLoader.stopLoading();
      EELoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  uploadUserProfilePicture()async{
    try{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70,maxHeight: 512, maxWidth: 512);
    if(image !=null) {
      imageUploading.value=true;
      final imageUrl = await userRepository.uploadImage(
          'Users/Images/Profile/', image);

      //update user image record
      Map<String, dynamic> json = {'ProfilePicture': imageUrl};
      await userRepository.updateSingleField(json);

      user.value.profilePicture = imageUrl;
      user.refresh();
      EELoaders.successSnackBar(title: 'Congratulations', message: 'Your Profile Image has been updated!');
    }
    }catch(e){
      EELoaders.errorSnackBar(title: 'Oh Snap!', message: 'Something went wrong $e');
    }finally{
      imageUploading.value=false;
    }
  }
}
