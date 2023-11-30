import 'package:alemeno/presentation_layer/widgets/custome_elevated_button.dart';
import 'package:alemeno/utils/app_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remixicon/remixicon.dart';

class TestContainer extends StatelessWidget {
  final String testName;
  final int numberOfTests;
  final double price;
  final double totalPrice;
  final String reportsTime;

  const TestContainer({
    Key? key,
    required this.testName,
    required this.numberOfTests,
    required this.price,
    required this.reportsTime,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.0.w,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              color: AppStyles.primaryColor.withOpacity(0.6),
            ),
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Text(testName, style: AppStyles.style3),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Includes $numberOfTests tests',
                      style: AppStyles.style4,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(19, 200, 230, 1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Icon(
                        Remix.shield_check_fill,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Text('Get reports in $reportsTime', style: AppStyles.style5),
                SizedBox(height: 4.0.h),
                Row(
                  children: [
                    Text(
                      '₹ $price',
                      style: AppStyles.style6,
                    ),
                    SizedBox(width: 8.0.w),
                    Text('₹ $totalPrice', style: AppStyles.style7),
                  ],
                ),
                SizedBox(height: 10.h),
                CustomContainer(
                  width: double.infinity,
                  backgroundColor: AppStyles.primaryColor,
                  text: 'Add to cart',
                  onTap: () {},
                  fontColor: Colors.white,
                  borderColor: Colors.transparent,
                ),
                SizedBox(height: 4.0.h),
                CustomContainer(
                  width: double.infinity,
                  backgroundColor: Colors.white,
                  text: 'View Details',
                  onTap: () {},
                  fontColor: AppStyles.primaryColor,
                  borderColor: AppStyles.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
