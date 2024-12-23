import 'package:apptofiretorasbpi/utils/constants/sizes.dart';
import 'package:apptofiretorasbpi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class EECircularIcon extends StatelessWidget {
  const EECircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = EESizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color, backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = EEHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor !=null ? backgroundColor! :
            dark ? EEColors.black.withOpacity(0.9)
            : EEColors.white.withOpacity(0.9),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon, color: color, size: size))
    );
  }
}
