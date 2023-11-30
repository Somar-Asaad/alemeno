import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static Color primaryColor = const Color.fromRGBO(10, 20, 159, 1);
  static Color accentColor = const Color.fromRGBO(19, 200, 230, 1);

  static TextStyle priceFontStyle1 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 18.0.sp,
    color: accentColor,
  );

  //grey heading style
  static TextStyle style1 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20.0.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF303030),
  );

  //primary heading style
  static TextStyle style2 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20.0.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF10217D),
  );

  //white body style
  static TextStyle style3 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13.0.sp,
    fontWeight: FontWeight.w700,
    color: const Color(0xFFFFFFFF),
  );

  //grey blue body style
  static TextStyle style4 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF475569),
  );

  //small blue grey body style
  static TextStyle style5 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 9.0.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF475569),
  );

  //primary bold body style
  static TextStyle style6 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF10217D),
  );

  //small prices style
  static TextStyle style7 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 10.0.sp,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.lineThrough,
    color: const Color(0xFF5B5B5B),
  );

  //grey small style
  static TextStyle style8 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 7.0.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF5B5B5B),
  );

  //white bold small style
  static TextStyle style9 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 8.0.sp,
    fontWeight: FontWeight.w700,
    color: const Color(0xFFFFFFFF),
  );

  //primary small style
  static TextStyle style10 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 8.0.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF10217D),
  );
}
