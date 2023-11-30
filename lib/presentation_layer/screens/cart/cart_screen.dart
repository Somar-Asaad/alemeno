import 'package:alemeno/data_layer/provider_data.dart';

import 'package:alemeno/presentation_layer/screens/cart/sections/agreement_widget.dart';
import 'package:alemeno/presentation_layer/screens/cart/sections/order_price_details_widget.dart';
import 'package:alemeno/presentation_layer/screens/cart/sections/order_review_widget.dart';
import 'package:alemeno/presentation_layer/screens/cart/sections/select_time_date_widget.dart';
import 'package:alemeno/presentation_layer/screens/sucess/success_screen.dart';
import 'package:alemeno/presentation_layer/widgets/custome_elevated_button.dart';
import 'package:alemeno/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    TestsProvider testsProvider = Provider.of<TestsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('My cart'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 18.0.w),
            child: Icon(
              Icons.more_vert,
              color: AppStyles.primaryColor,
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: Builder(
          builder: (BuildContext context) {
            if (testsProvider.addedToCartTests.isEmpty) {
              // Added to cart list is empty, show default screen
              return Center(
                child: Text(
                  'Your cart is empty. Please add tests to proceed.',
                  style: AppStyles.style2,
                ),
              );
            } else {
              // Added to cart list is not empty, show cart content
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order review',
                      style: AppStyles.style2,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    const OrderReview(),
                    const SelectTimeDateWidget(),
                    const OrderPriceDetailsWidget(),
                    const AgreementWidget(),
                    CustomContainer(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      width: double.infinity,
                      borderRadius: 10,
                      backgroundColor: (testsProvider.selectedDate != null &&
                              testsProvider.selectedTime != null &&
                              testsProvider.hardCopySelected)
                          ? AppStyles.primaryColor
                          : Colors.grey.shade400,
                      text: 'Schedule',
                      onTap: () {
                        if (testsProvider.selectedDate != null &&
                            testsProvider.selectedTime != null &&
                            testsProvider.hardCopySelected) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const SuccessScreen(),
                            ),
                          );
                        }
                      },
                      fontColor: Colors.white,
                      borderColor: Colors.transparent,
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
