import 'package:apptofiretorasbpi/common/widgets/loader/loader.dart';
import 'package:apptofiretorasbpi/data/repositories/authentication/authentication_repository.dart';
import 'package:apptofiretorasbpi/data/repositories/data/user_repository.dart';
import 'package:apptofiretorasbpi/features/authentication/screens/signup/verify_email.dart';
import 'package:apptofiretorasbpi/utils/constants/image_strings.dart';
import 'package:apptofiretorasbpi/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../../../../utils/helpers/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///Signup
  void signup() async {
    try {
      //start loading
      EEFullScreenLoader.openLoadingDialogue(
          'We are processing your information...', EEImage.processingAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EEFullScreenLoader.stopLoading();
        return;
      }

      //Form validation
      if (!signupFormKey.currentState!.validate()) {
        EEFullScreenLoader.stopLoading();
        return;}

      // privacy policy check
      if (!privacyPolicy.value) {
        EELoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create account, you must have to read and accept the privacy policy & terms of Use.',
        );
        return;
      }

      //Register user in the firebase Authentication & Save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      //Save authentication user data in the firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          username: username.text.trim(),
          email: email.text.trim(),
          firstName: firstname.text.trim(),
          lastName: lastname.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      EEFullScreenLoader.stopLoading();

      //show success
      EELoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email to continue.');
      Get.to(()=> VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      EEFullScreenLoader.stopLoading();
      EELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
