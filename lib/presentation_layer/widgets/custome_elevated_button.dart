import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final double width;
  final Color backgroundColor;
  final String text;
  final Function onTap;
  final Color fontColor;
  final FontWeight fontWeight;
  final double borderRadius;
  final Icon? prefixIcon;
  final Icon? postfixIcon;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final double? borderWidth;
  final MainAxisAlignment? mainAxisAlignment;

  const CustomContainer({
    Key? key,
    required this.width,
    required this.backgroundColor,
    required this.text,
    required this.onTap,
    required this.fontColor,
    this.fontWeight = FontWeight.bold,
    this.borderRadius = 10.0,
    this.prefixIcon,
    this.postfixIcon,
    required this.borderColor,
    this.padding,
    this.borderWidth,
    this.mainAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Execute the provided function when the container is tapped
        onTap();
      },
      child: Container(
        width: width,
        padding: padding ??  EdgeInsets.symmetric(vertical: 10.0.h),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: borderWidth ?? 1.0),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) prefixIcon!,
            Center(
              child: Text(
                text,
                style: TextStyle(
                  color: fontColor,
                  fontWeight: fontWeight,
                ),
              ),
            ),
            if (postfixIcon != null) postfixIcon!,
          ],
        ),
      ),
    );
  }
}
