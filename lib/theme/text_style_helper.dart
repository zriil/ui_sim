import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Display Styles
  // Large text styles typically used for headers and hero elements

  TextStyle get display96BlackInter => TextStyle(
        fontSize: 96.fSize,
        fontWeight: FontWeight.w900,
        fontFamily: 'Inter',
        color: appTheme.whiteCustom,
      );

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title20RegularRoboto => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      );

  TextStyle get title20BlackInter => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w900,
        fontFamily: 'Inter',
        color: appTheme.whiteCustom,
      );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body14BlackInter => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w900,
        fontFamily: 'Inter',
        color: appTheme.whiteCustom,
      );

  TextStyle get body13BlackInter => TextStyle(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w900,
        fontFamily: 'Inter',
      );

  // Label Styles
  // Small text styles for labels, captions, and hints

  TextStyle get label11MediumInter => TextStyle(
        fontSize: 11.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
        color: appTheme.whiteCustom,
      );

  TextStyle get label10BlackInter => TextStyle(
        fontSize: 10.fSize,
        fontWeight: FontWeight.w900,
        fontFamily: 'Inter',
        color: appTheme.colorFFE0B5,
      );

  TextStyle get label8BlackInter => TextStyle(
        fontSize: 8.fSize,
        fontWeight: FontWeight.w900,
        fontFamily: 'Inter',
        color: appTheme.whiteCustom,
      );
}
