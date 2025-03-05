import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget web;
  final Widget? mediumDevice;
  final Widget? cellPhone;
  const ResponsiveWidget(
      {super.key,
      required this.mobile,
      required this.web,
      this.mediumDevice,
      this.cellPhone});

  @override
  Widget build(BuildContext context) {
    bool value = false;
    kIsWeb ? value = true : value = false;
    return LayoutBuilder(builder: (context, constraints) {
      if (!value) {
        return cellPhone ?? mobile;
      }

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
