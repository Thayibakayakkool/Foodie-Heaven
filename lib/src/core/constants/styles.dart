import 'package:flutter/material.dart';

TextStyle regularTextStyle(
    FontWeight fontWeight, Color color, double fontSize) {
  return TextStyle(
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color,
  );
}

TextStyle textStyleColor(Color color) {
  return TextStyle(
    color: color,
  );
}

TextStyle textStyle(Color color, double fontSize) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
  );
}

TextStyle boldColorTextStyle(Color color, FontWeight fontWeight) {
  return TextStyle(color: color, fontWeight: fontWeight);
}

TextStyle fontStyleAndColor(Color color, FontStyle fontStyle) {
  return TextStyle(color: color, fontStyle: fontStyle);
}

TextStyle forgotTextStyle(Color color, double fontSize, FontStyle fontStyle) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontStyle: fontStyle,
  );
}
