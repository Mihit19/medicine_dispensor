import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class EESearchContainer extends StatelessWidget {
  const EESearchContainer({
    super.key, required this.text, this.icon, this.showBackground = true, this.showBorder=true, this.onTap,this.padding=const EdgeInsets.symmetric(horizontal: EESizes.defaultSpace)
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = EEHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: EEDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(EESizes.md),
          decoration: BoxDecoration(
            color: showBackground? dark ? EEColors.dark:EEColors.light : Colors.transparent,
            borderRadius: BorderRadius.circular(EESizes.cardRadiusLg),
            border: showBorder ? Border.all(color: dark ? EEColors.dark:EEColors.light):null,
          ),
          child: Row(
            children: [
              Icon(icon, color: EEColors.darkerGrey,),
              const SizedBox(width: EESizes.spaceBtwItems,),
              Text(text, style: Theme.of(context).textTheme.bodySmall!.apply(color: EEColors.darkGrey)),
            ],
          ),
        ),
      ),
    );
  }
}
