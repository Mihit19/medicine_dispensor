import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class EEPrimaryHeaderContainer extends StatelessWidget {
  const EEPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return EECurvedEdgesWidget(
      child: Container(
        color: EEColors.primary,
        padding: const EdgeInsets.only(bottom: 0),
        child: Stack(
          children: [
            Positioned(
                top: -150,
                right: -250,
                child: EECircularContainer(
                    backgroundColor: EEColors.textWhite.withOpacity(0.1))),
            Positioned(
                top: 100,
                right: -300,
                child: EECircularContainer(
                    backgroundColor: EEColors.textWhite.withOpacity(0.1))),
            child,
          ],
        ),
      ),
    );
  }
}
