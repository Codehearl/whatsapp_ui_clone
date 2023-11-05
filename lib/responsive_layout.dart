import 'package:flutter/material.dart';


class ResponsiveLayout extends StatelessWidget {
  
  final Widget webLayout;
  final Widget mobileLayout;
  const ResponsiveLayout(
      {super.key, required this.webLayout, required this.mobileLayout});

  @override
  Widget build(BuildContext context) {
    var isLandscaped = MediaQuery.of(context).orientation == Orientation.landscape;
    return OrientationBuilder(builder: (context, rientation) {
      if (isLandscaped) {
        return webLayout;
      } else {
        return mobileLayout;
      }
    });
  }
}
