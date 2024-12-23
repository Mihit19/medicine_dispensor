import 'package:apptofiretorasbpi/features/authentication/controllers/signup/signup_controller.dart';
import 'package:apptofiretorasbpi/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:apptofiretorasbpi/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class EESignupForm extends StatelessWidget {
  const EESignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstname,
                  validator: (value) =>
                      EEValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: EETexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(
                width: EESizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastname,
                  validator: (value) =>
                      EEValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: EETexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: EESizes.spaceBtwInputFields,
          ),

          ///Username
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                EEValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: EETexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(
            height: EESizes.spaceBtwInputFields,
          ),

          ///Email
          TextFormField(
            validator: (value) => EEValidator.validateEmail(value),
            controller: controller.email,
            decoration: const InputDecoration(
              labelText: EETexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(
            height: EESizes.spaceBtwInputFields,
          ),

          ///Phone Number
          TextFormField(
            validator: (value) => EEValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
              labelText: EETexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: EESizes.spaceBtwInputFields,
          ),

          ///Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => EEValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: EETexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye)),
              ),
            ),
          ),
          const SizedBox(
            height: EESizes.spaceBtwInputFields,
          ),

          ///Terms and conditions checkbox
          const EETermsAndConditionCheckBox(),
          const SizedBox(
            height: EESizes.spaceBtwSections,
          ),

          ///create account Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text(EETexts.createAccount)),
          )
        ],
      ),
    );
  }
}
