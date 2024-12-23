import 'package:apptofiretorasbpi/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

import '../constants/sizes.dart';

class EEBoxesShimmer extends StatelessWidget {
  const EEBoxesShimmer ({super.key});
  @override
  Widget build (BuildContext context) {
    return const Column(
        children: [
    Row(
    children: [
    Expanded (child: EEShimmerEffect (width: 150, height: 110)),
    SizedBox(width: EESizes.spaceBtwItems),
    Expanded (child: EEShimmerEffect (width: 150, height: 110)),
    SizedBox (width: EESizes.spaceBtwItems),
    Expanded (child: EEShimmerEffect (width: 150, height: 110)),
    ],
    ) // Row
    ],
    ); // Column
  }
}