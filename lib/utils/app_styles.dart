import 'package:flutter/material.dart';
import 'package:toolkit/utils/app_colors.dart';

class AppStyles {
  static final AppStyles _instance = AppStyles._internal();

  factory AppStyles() {
    return _instance;
  }

  AppStyles._internal();

  static TextStyle _baseTextStyle(
      Color color, double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontFamily: 'poppins',
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  TextStyle get blackBold16 => _baseTextStyle(kBlack, 16.0, FontWeight.bold);
  TextStyle get blackRegular11 => _baseTextStyle(kBlack, 11.0, FontWeight.w500);

  TextStyle get primBold20 => _baseTextStyle(kPrimary, 20.0, FontWeight.bold);
}
