import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class EEGridLayout extends StatelessWidget {
  const EEGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent= 288,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: EESizes.gridViewSpacing,
        crossAxisSpacing: EESizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
