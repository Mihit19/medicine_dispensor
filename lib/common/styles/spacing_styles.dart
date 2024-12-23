import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class EESpacingStyle{
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: EESizes.appBarHeight,
    left: EESizes.defaultSpace,
    bottom: EESizes.defaultSpace,
    right: EESizes.defaultSpace,
  );
}