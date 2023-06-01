import 'package:flutter/material.dart';

abstract class ThemeText {
  static const Color textColor = Colors.black;
  static Color placeholderColor = Colors.grey.withOpacity(0.5);
  static double lineHeight = 1.2;

  static TextStyle header = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: textColor,
      height: lineHeight);

  static TextStyle title = TextStyle(
      fontSize: 16,
      // fontWeight: FontWeight.bold,
      fontFamily: 'Poppins-Regular',
      color: textColor,
      height: lineHeight);

  static TextStyle text = TextStyle(
      fontSize: 14,
      fontFamily: 'Poppins-Regular',
      color: textColor,
      height: lineHeight);

  static TextStyle subtitle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: textColor,
      height: lineHeight);

  static TextStyle placeholder = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.normal,
      color: placeholderColor,
      height: lineHeight);
}
