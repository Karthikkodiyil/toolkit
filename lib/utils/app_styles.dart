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

  static TextStyle _strikeTextStyle(Color color, double fontSize,
      FontWeight fontWeight, TextDecoration? decoration) {
    return TextStyle(
        fontFamily: 'poppins',
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration);
  }

  TextStyle get primMedium16 => _baseTextStyle(kPrimary, 16.0, FontWeight.w500);
  TextStyle get blackBold16 => _baseTextStyle(kBlack, 16.0, FontWeight.bold);
  TextStyle get whiteBold16 => _baseTextStyle(kWhite, 18.0, FontWeight.w500);
  TextStyle get blackRegular11 => _baseTextStyle(kBlack, 11.0, FontWeight.w500);
  TextStyle get primBold20 => _baseTextStyle(kPrimary, 20.0, FontWeight.bold);
  TextStyle get blackBold14 => _baseTextStyle(kBlack, 14.0, FontWeight.w500);
  TextStyle get blackRegular10 => _baseTextStyle(kBlack, 10.0, FontWeight.w500);
  TextStyle get whiteBold14 => _baseTextStyle(
        kWhite,
        14.0,
        FontWeight.w500,
      );

  TextStyle get strikeText =>
      _strikeTextStyle(kRed, 14.0, FontWeight.w200, TextDecoration.lineThrough);

  TextStyle get whiteRegular18 =>
      _strikeTextStyle(kWhite, 18.0, FontWeight.w500, TextDecoration.none);
}
