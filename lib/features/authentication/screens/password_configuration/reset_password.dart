import 'package:apptofiretorasbpi/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:apptofiretorasbpi/features/authentication/screens/login/login.dart';
import 'package:apptofiretorasbpi/utils/constants/image_strings.dart';
import 'package:apptofiretorasbpi/utils/constants/sizes.dart';
import 'package:apptofiretorasbpi/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/helper_functions.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.to(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EESizes.defaultSpace),
          child: Column(
            children: [
              /// Image with 60& of screen width
              Image(
                image: const AssetImage(EEImage.emailSent),
                width: EEHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: EESizes.spaceBtwSections,
              ),

              /// Email, Title and Subtitle
              Text(email,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center),
              const SizedBox(height: EESizes.spaceBtwSections),
              Text(
                EETexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: EESizes.spaceBtwItems,
              ),
              Text(
                EETexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: EESizes.spaceBtwSections,
              ),
              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.offAll(() => const LoginScreen()),
                      child: const Text(EETexts.done))
              ),
              const SizedBox(
                height: EESizes.spaceBtwItems,
              ),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email),
                      child: const Text(EETexts.resendEmail))
              ),
            ],
          ),
        ),
      ),
    );
  }
}
