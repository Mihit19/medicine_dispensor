import 'package:apptofiretorasbpi/utils/constants/sizes.dart';
import 'package:apptofiretorasbpi/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class EECategoryShimmer extends StatelessWidget {
  const EECategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>
        const SizedBox(width: EESizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ///Image
              EEShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: EESizes.spaceBtwItems / 2),

              ///Text
              EEShimmerEffect(width: 55, height: 8)
            ],
          );
        },
      ),
    );
  }
}
