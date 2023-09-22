import 'dart:ui';

import 'package:flutter/material.dart';

class AppColor{

  static const Color primary = Color(0XFF210062);
  static const Color secondary = Color(0XFF77037B);
  static const Color textColor = Color(0XFFFDF4F5);
  static const Color lightPrimary = Color(0XFFBA90C6);
  static const Color darkBlue = Color(0XFF00337C);






}
extension ColorExt on Color {
  Color disable(bool? status) {
    if (status != null && !status) {
      return this;
    }

    return withOpacity(0.5);
  }
}