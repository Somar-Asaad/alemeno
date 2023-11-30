import 'package:alemeno/data_layer/provider_data.dart';
import 'package:alemeno/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OrderPriceDetailsWidget extends StatelessWidget {
  const OrderPriceDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TestsProvider>(
      builder: (context, testsProvider, child) {
        List<Test> addedToCartTests = testsProvider.addedToCartTests;

        // Calculate total price
        double totalPrice = addedToCartTests
            .map((test) => test.totalPrice)
            .reduce((value, element) => value + element);

        // Calculate discount
        double  amountToBePaid= addedToCartTests
            .map((test) => test.discountedPrice)
            .reduce((value, element) => value + element);

        // Calculate amount to be paid
        double discount = totalPrice - amountToBePaid;

        return Container(
          margin: EdgeInsets.symmetric(vertical: 10.h),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'M.R.P Total',
                    style: AppStyles.style4,
                  ),
                  Text(
                    '₹ $totalPrice', // Display the calculated total price
                    style: AppStyles.style4,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discount',
                    textAlign: TextAlign.start,
                    style: AppStyles.style4,
                  ),
                  Text(
                    '₹ $discount', // Display the calculated discount
                    style: AppStyles.style4,
                  ),
                ],
              ),
              SizedBox(
                height: 17.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Amount to be paid',
                    style: AppStyles.style2.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                  Text(
                    '₹ $amountToBePaid', // Display the calculated amount to be paid
                    style: AppStyles.style2.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 28.0.w),
                    child: const Text('Total savings'),
                  ),
                  Text(
                    '₹ $discount', // Display the calculated savings (same as discount)
                    style: AppStyles.style2.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
