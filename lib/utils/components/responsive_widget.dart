import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget web;
  final Widget? mediumDevice;
  const ResponsiveWidget(
      {super.key, required this.mobile, required this.web, this.mediumDevice});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return mobile;
      }
      if (constraints.maxWidth > 600 && constraints.maxWidth < 900) {
        return mediumDevice ?? web;
      } else {
        return web;
      }
    });
  }
}
