import 'package:apptofiretorasbpi/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';


class EETabBar extends StatelessWidget implements PreferredSizeWidget {
  const EETabBar({
    super.key, required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = EEHelperFunctions.isDarkMode(context);
    return Material(
      child: TabBar(
          isScrollable: true,
          indicatorColor: EEColors.primary,
          labelColor: dark
              ? EEColors.white
              : EEColors.primary,
          unselectedLabelColor: EEColors.darkGrey,
          tabs: tabs
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(EEDeviceUtils.getAppBarHeight());
}
