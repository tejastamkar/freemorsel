import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeletonContainer extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const SkeletonContainer({
    super.key,
    required this.radius,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonAnimation(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: Colors.grey[300]),
        width: width,
        height: height,
      ),
    );
  }
}
