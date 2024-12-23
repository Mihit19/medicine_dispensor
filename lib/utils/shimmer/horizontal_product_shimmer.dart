import 'package:apptofiretorasbpi/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

import '../constants/sizes.dart';

class EEHorizontalProductShimmer extends StatelessWidget {
  const EEHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only (bottom: EESizes.spaceBtwSections),
        height: 120,
        child: ListView.separated(
            itemCount: itemCount,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) =>
            const SizedBox(width: EESizes.spaceBtwItems),
            itemBuilder: (_, __) =>
            const Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  /// Image
                  EEShimmerEffect(width: 120, height: 120),
                  SizedBox(width: EESizes.spaceBtwItems),

                  /// Text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: EESizes.spaceBtwItems / 2),
                      EEShimmerEffect(width: 160, height: 15),
                      SizedBox(height: EESizes.spaceBtwItems / 2),
                      EEShimmerEffect(width: 110, height: 15),
                      SizedBox(height: EESizes.spaceBtwItems / 2),
                      EEShimmerEffect(width: 80, height: 15),
                      Spacer(),
                    ],
                  ),
                ]
            )
        )
    );
  }
}
