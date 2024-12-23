import 'package:apptofiretorasbpi/data/repositories/authentication/authentication_repository.dart';
import 'package:apptofiretorasbpi/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:apptofiretorasbpi/utils/constants/image_strings.dart';
import 'package:apptofiretorasbpi/utils/constants/sizes.dart';
import 'package:apptofiretorasbpi/utils/constants/text_strings.dart';
import 'package:apptofiretorasbpi/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => AuthenticationRepository.instance.logout()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EESizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(
                image: const AssetImage(EEImage.verifyEmail),
                width: EEHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: EESizes.spaceBtwSections,
              ),

              ///Title & SubTitle
              Text(
                EETexts.confirmEmailTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: EESizes.spaceBtwItems,
              ),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: EESizes.spaceBtwItems,
              ),
              Text(
                EETexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: EESizes.spaceBtwSections,
              ),

              ///Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.checkEmailVerificationStatus(),
                      child: const Text(EETexts.eContinue))),
              const SizedBox(
                height: EESizes.spaceBtwItems,
              ),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => controller.sendEmailVerification(),
                      child: const Text(EETexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
