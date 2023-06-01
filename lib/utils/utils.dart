import 'package:flutter/cupertino.dart';

abstract class Utils {
  static String errorMsg = 'Ops, something went wrong. Please try again.';

  static BoxShadow boxShadow = const BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.1),
      offset: Offset(0, 2),
      spreadRadius: 0,
      blurRadius: 10);

  static BorderRadiusDirectional borderRadiusDirectional =
      BorderRadiusDirectional.only(
          topStart: Radius.circular(borderRadius),
          topEnd: Radius.circular(borderRadius));

  static double borderRadius = 15.0;
  static double horizontalPadding = 20.0;
}
