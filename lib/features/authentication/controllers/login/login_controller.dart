import 'package:apptofiretorasbpi/features/authentication/controllers/user/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../common/widgets/loader/loader.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../user/user_controller.dart';

class LoginController extends GetxController{

  ///variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());


  @override
  void onInit() {
    super.onInit();
    final savedEmail = localStorage.read('REMEMBER_ME_EMAIL');
    final savedPassword = localStorage.read('REMEMBER_ME_PASSWORD');
    if (savedEmail != null) email.text = savedEmail;
    if (savedPassword != null) password.text = savedPassword;
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      //start loading
      EEFullScreenLoader.openLoadingDialogue(
          'Logging you in...', EEImage.processingAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EEFullScreenLoader.stopLoading();
        return;
      }

      //Form validation
      if (!loginFormKey.currentState!.validate()) {
        EEFullScreenLoader.stopLoading();
        return;}

      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove loader
      EEFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      EEFullScreenLoader.stopLoading();
      EELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> googleSignIn()async{
    try{
      //start loading
      EEFullScreenLoader.openLoadingDialogue(
          'Logging you in...', EEImage.processingAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EEFullScreenLoader.stopLoading();
        return;
      }

      //google authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      //save user record
      await userController.saveUserRecord(userCredentials);

      //Remove loading
      EEFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();

    }catch (e){
      EEFullScreenLoader.stopLoading();
      EELoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }
}
