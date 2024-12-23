import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';

class EETermsAndConditionCheckBox extends StatelessWidget {
  const EETermsAndConditionCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = EEHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value))),
        const SizedBox(
          width: EESizes.spaceBtwItems,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '${EETexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: EETexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? EEColors.white : EEColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? EEColors.white : EEColors.primary,
                    ),
              ),
              TextSpan(
                  text: ' ${EETexts.and} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: EETexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? EEColors.white : EEColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? EEColors.white : EEColors.primary,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
