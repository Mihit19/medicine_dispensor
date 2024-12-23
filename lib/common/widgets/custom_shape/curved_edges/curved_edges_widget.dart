import 'package:flutter/material.dart';

import 'curved_edges.dart';

class EECurvedEdgesWidget extends StatelessWidget {
  const EECurvedEdgesWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: EECustomCurvedEdges(),
        child: child
    );
  }
}