import 'package:alemeno/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function onTap;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      style: TextButton.styleFrom(
        padding:  EdgeInsets.all(10.r),
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: AppStyles.style2.copyWith(
              fontSize: 12.sp,
              letterSpacing: 0.5.w,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Icon(
            Icons.arrow_forward,
            semanticLabel: 'Right Arrow',
            size: 18.0.sp,
            color: AppStyles.primaryColor,
          ),
        ],
      ),
    );
  }
}
