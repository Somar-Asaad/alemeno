import 'package:alemeno/presentation_layer/widgets/custome_elevated_button.dart';
import 'package:alemeno/utils/app_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remixicon/remixicon.dart';

class PopularPackageWidget extends StatefulWidget {
  const PopularPackageWidget({super.key});

  @override
  State<PopularPackageWidget> createState() => _PopularPackageWidgetState();
}

class _PopularPackageWidgetState extends State<PopularPackageWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin:  EdgeInsets.symmetric(horizontal: 20.w),
        padding:  EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundColor: AppStyles.primaryColor.withOpacity(0.1),
                  child:  Icon(
                    Remix.medicine_bottle_line,
                    color: AppStyles.primaryColor,
                    size: 40.r,
                  ),
                ),
                Container(
                  padding:
                       EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: AppStyles.accentColor,
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Remix.shield_check_fill,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Safe',
                        style: AppStyles.style3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding:  EdgeInsets.symmetric(vertical: 10.h),
              child: Text(
                'Full Body checkup',
                style: AppStyles.style2.copyWith(
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
            ),
            RichText(
              text:  TextSpan(
                children: [
                  const TextSpan(text: 'Includes 92 tests\n  '),
                  const TextSpan(text: '• Blood Glucose Fasting\n  '),
                  const TextSpan(text: '• Liver Function Test\n'),
                  TextSpan(
                    text: 'View more',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      height: 1.5.h,
                    ),
                  ),
                ],
                style: AppStyles.style4,
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 18.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Text(
                    '₹ 2000/-',
                    style: AppStyles.priceFontStyle1,
                  ),
                  CustomContainer(
                    borderRadius: 4,
                    padding:  EdgeInsets.symmetric(vertical: 5.h),
                    width: 100.w,
                    backgroundColor: Colors.white,
                    text: 'Add to cart',
                    onTap: () {},
                    fontColor: AppStyles.primaryColor,
                    borderColor: AppStyles.primaryColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
