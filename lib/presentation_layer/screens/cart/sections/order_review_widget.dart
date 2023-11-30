import 'package:alemeno/data_layer/provider_data.dart';
import 'package:alemeno/presentation_layer/widgets/custome_elevated_button.dart';
import 'package:alemeno/utils/app_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:remixicon/remixicon.dart';

class OrderReview extends StatefulWidget {
  const OrderReview({super.key});

  @override
  State<OrderReview> createState() => _OrderReviewState();
}

class _OrderReviewState extends State<OrderReview> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TestsProvider>(
      builder: (context, testsProvider, child) {
        List<Test> selectedTests = testsProvider.addedToCartTests;
        return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            Test test = selectedTests[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 5.h),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppStyles.primaryColor.withOpacity(0.4),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8),
                        topLeft: Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Pathology tests',
                      style: AppStyles.style3,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              test.testName,
                              style: AppStyles.style4,
                            ),
                            Text(
                              test.discountedPrice.toString(),
                              style: AppStyles.priceFontStyle1,
                            )
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            test.totalPrice.toString(),
                            style: AppStyles.style7,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: CustomContainer(
                            width: 150.w,
                            backgroundColor: Colors.white,
                            text: 'Remove',
                            borderWidth: 2.w,
                            borderRadius: 30,
                            onTap: () {testsProvider.removeTestFromCart(test);},
                            fontColor: AppStyles.primaryColor,
                            borderColor: AppStyles.primaryColor,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            prefixIcon: Icon(
                              Remix.delete_bin_6_line,
                              color: AppStyles.primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomContainer(
                          width: double.infinity,
                          borderRadius: 30,
                          borderWidth: 2.w,
                          backgroundColor: Colors.white,
                          text: 'Upload prescription (optional)',
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          onTap: () {},
                          fontColor: AppStyles.primaryColor,
                          borderColor: AppStyles.primaryColor,
                          prefixIcon: Icon(
                            Icons.file_upload_outlined,
                            size: 30.r,
                            color: AppStyles.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          itemCount: selectedTests.length,
        );
      },
    );
  }
}
