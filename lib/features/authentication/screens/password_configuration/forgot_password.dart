import 'package:apptofiretorasbpi/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:apptofiretorasbpi/utils/constants/sizes.dart';
import 'package:apptofiretorasbpi/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(padding: const EdgeInsets.all(EESizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///Headings
        Text(EETexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium,
      ),
        const SizedBox(
          height: EESizes.spaceBtwItems,),
        Text(
          EETexts.forgetPasswordSubTitle,
          style: Theme.of(context).textTheme.labelMedium
        ),
        const SizedBox(
          height: EESizes.spaceBtwSections * 2,),
          ///Text field
          Form(
            key: controller.forgetPasswordFormKey,
            child: TextFormField(
              controller: controller.email,
              validator: EEValidator.validateEmail,
              decoration: const InputDecoration(
                labelText: EETexts.email,prefixIcon: Icon(Iconsax.direct_right)
              ),
            ),
          ),
          const SizedBox(
            height: EESizes.spaceBtwSections,),
          ///Submit Button
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.sendPasswordResetEmail(), child: const Text(EETexts.submit)))
        ],

      ),
      ),
    );
  }
}
