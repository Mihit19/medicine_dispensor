import 'package:apptofiretorasbpi/utils/constants/colors.dart';
import 'package:apptofiretorasbpi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EERoundedContainer extends StatelessWidget {
  const EERoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius=EESizes.cardRadiusLg,
      this.child,
      this.showBorder = false,
      this.borderColour=EEColors.borderPrimary,
      this.backgroundColor=EEColors.white,
      this.padding,
      this.margin});

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColour;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder? Border.all(color: borderColour): null,
      ),
      child: child,
    );
  }
}
