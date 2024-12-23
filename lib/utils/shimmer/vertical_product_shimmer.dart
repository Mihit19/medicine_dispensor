import 'package:apptofiretorasbpi/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/layouts/grid_layout.dart';
import '../constants/sizes.dart';

class EEVerticalProductShimmer extends StatelessWidget {
  const EEVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return EEGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) =>
      const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Image
            EEShimmerEffect(width: 180, height: 180),
            SizedBox(height: EESizes.spaceBtwItems),

            /// Text
            EEShimmerEffect(width: 160, height: 15),
            SizedBox(height: EESizes.spaceBtwItems / 2),
            EEShimmerEffect(width: 110, height: 15),
          ],
        ), // Column
      ), // SizedBox
    ); // TGridLayout
  }
}