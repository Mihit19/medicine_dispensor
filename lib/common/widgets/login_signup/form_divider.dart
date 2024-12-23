import 'package:apptofiretorasbpi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';


class EEFormDivider extends StatelessWidget {
  const EEFormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark=EEHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark ? EEColors.darkGrey: EEColors.grey, thickness: 0.5, indent: 60, endIndent: 5,)),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium),
        Flexible(child: Divider(color: dark ? EEColors.darkGrey: EEColors.grey, thickness: 0.5, indent: 5, endIndent: 60,)),
      ],
    );
  }
}