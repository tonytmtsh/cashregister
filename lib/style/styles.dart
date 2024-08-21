import 'package:flutter/material.dart';

class Fonts {
  static String get body => "Lato";
  static String get title => "Roboto";
}

class FontSizes {
  static double scale = 1;

  static double get body => 14 * scale;
  static double get bodySm => 12 * scale;
  static double get title => 24 * scale;
  static double get display => 42 * scale;
  static double get display2 => 36 * scale;
}

class TextStyles {
  static TextStyle get bodyFont => TextStyle(fontFamily: Fonts.body);
  static TextStyle get titleFont => TextStyle(fontFamily: Fonts.title);

  static TextStyle get title => titleFont.copyWith(fontSize: FontSizes.title);
  static TextStyle get titleLight =>
      title.copyWith(fontWeight: FontWeight.w300);

  static TextStyle get display =>
      titleFont.copyWith(fontSize: FontSizes.display);
  static TextStyle get display2 =>
      titleFont.copyWith(fontSize: FontSizes.display2);

  static TextStyle get body =>
      bodyFont.copyWith(fontSize: FontSizes.body, fontWeight: FontWeight.w400);
  static TextStyle get bodySm => body.copyWith(fontSize: FontSizes.bodySm);
}

extension TextStyleHelpers on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle letterSpace(double value) => copyWith(letterSpacing: value);
}
