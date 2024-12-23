import 'package:apptofiretorasbpi/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

import '../constants/sizes.dart';

class EEListTileShimmer extends StatelessWidget {
  const EEListTileShimmer ({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            EEShimmerEffect (width: 50, height: 50, radius: 50),
            SizedBox(width: EESizes.spaceBtwItems),
            Column(
              children: [
                EEShimmerEffect (width: 100, height: 15),
                SizedBox (height: EESizes.spaceBtwItems / 2),
                EEShimmerEffect (width: 80, height: 12),
              ],
            ), // Column
          ],
        ), // Row
      ],
    ); // Column
  }
}