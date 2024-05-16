import 'package:flutter/material.dart';

class ColorManager {
  static Color general = const Color(0xffffffff);

  static Color primary = const Color(0xFF7BB3FF);

  static Color background1 = const Color(0xffEA94D7);
  static Color background2 = const Color(0xffDDCDFF);
  static Color background3 = const Color(0xffFFDADA);
  static Color textColor = const Color(0xff4A4A4A);
  static Color background = const Color(0xffDDCDFF);
  static Color btnColor1 = const Color(0xffEFD8F9);
  static Color btnColor2 = const Color(0xffEBF6FF);
  static Color neutral400 = const Color(0xffFFFFFF);
  static Color neutral300 = const Color(0xffD1D5DB);
  static Color neutral200 = const Color(0xFFFAFAFA);
  static Color neutral100 = const Color(0xFFF4F4F5);

  static Color danger500 = const Color(0xFFFF472B);
  static Color success500 = const Color(0xFF60C631);
  static Color success700 = const Color(0xFF2E8E18);

  static Color splashColor = const Color(0xffD6E4FF);

  static Color colorBoarderChange(bool selected) {
    return selected ? ColorManager.primary : ColorManager.neutral300;
  }

  static Color colorBodyChange(bool selected) {
    return selected ? ColorManager.primary : ColorManager.neutral200;
  }
}