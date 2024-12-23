import 'package:apptofiretorasbpi/common/styles/spacing_styles.dart';
import 'package:apptofiretorasbpi/features/authentication/screens/login/widget/login_form.dart';
import 'package:apptofiretorasbpi/features/authentication/screens/login/widget/login_header.dart';
import 'package:apptofiretorasbpi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_button.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EESpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title &Sub-Title
              const EELoginHeader(),

              /// Form
              const EELoginForm(),
              /// Divider
              EEFormDivider(dividerText: EETexts.orSignInWith.capitalize!),
              const SizedBox(height: EESizes.spaceBtwSections,),
              /// Footer
              const EESocialButton()
            ],
          ),
        ),
      ),
    );
  }
}






