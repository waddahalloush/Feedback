import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final double marginV;
  final double marginH;
  final bool isDarkmode;
  final BoxShape shapeBorder;
  final double radius;
  const ShimmerWidget.rectangular(
      {super.key,
      required this.width,
      this.isDarkmode = false,
      this.radius = 2.0,
      this.marginH = 0.0,
      this.marginV = 0.0,
      required this.height,
      this.shapeBorder = BoxShape.rectangle});
  const ShimmerWidget.circular(
      {super.key,
      required this.height,
      required this.width,
      this.isDarkmode = false,
      this.marginH = 0.0,
      this.marginV = 0.0,
      this.radius = 2.0,
      this.shapeBorder = BoxShape.circle});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Theme.of(context).scaffoldBackgroundColor,
        highlightColor: Colors.grey.shade100,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: marginH, vertical: marginV),
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: Colors.grey,
              shape: shapeBorder,
              borderRadius: BorderRadius.circular(radius)),
        ));
  }
}
