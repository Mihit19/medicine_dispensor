import 'package:apptofiretorasbpi/utils/constants/sizes.dart';
import 'package:apptofiretorasbpi/utils/constants/text_strings.dart';
import 'package:apptofiretorasbpi/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../authentication/controllers/user/user_controller.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Re-Authenticate User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EESizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: EEValidator.validateEmail,
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right),labelText: EETexts.email),
                ),
                const SizedBox(height: EESizes.spaceBtwInputFields),
                Obx(() => TextFormField(
                  obscureText: controller.hidePassword.value,
                  controller: controller.verifyPassword,
                  validator: (value) => EEValidator.validateEmptyText('Password',value),
                  decoration: InputDecoration(
                    labelText: EETexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                      icon: const Icon(Iconsax.eye_slash),
                    )
                  ),
                )
                ),
                const SizedBox(height: EESizes.spaceBtwSections),
                
                ///Login button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () => controller.reAuthenticateEmailAndPasswordUser(), child: const Text('verify'),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
