import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget web;
  final Widget? smallDevice;
  const ResponsiveWidget({super.key, required this.mobile, required this.web,this.smallDevice});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return mobile;
      } else {
        return web;
      }
    });
  }
}
