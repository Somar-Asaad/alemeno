import 'package:alemeno/data_layer/provider_data.dart';
import 'package:alemeno/presentation_layer/screens/cart/cart_screen.dart';
import 'package:alemeno/presentation_layer/screens/home_page/sections/popular_lab_test_container.dart';
import 'package:alemeno/presentation_layer/screens/home_page/sections/popular_package_widget.dart';
import 'package:alemeno/presentation_layer/widgets/custome_text_button.dart';
import 'package:alemeno/utils/app_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Logo',
          style: AppStyles.style1,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const CartScreen()));
              },
              icon: Icon(
                Icons.shopping_cart_sharp,
                color: AppStyles.primaryColor,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular lab tests',
                    style: AppStyles.style2,
                  ),
                  CustomTextButton(
                    text: 'View more',
                    onTap: () {},
                  ),
                ],
              ),
              Consumer<TestsProvider>(builder: (context, testsProvider, child) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisSpacing: 15.h,
                    crossAxisSpacing: 20.w,
                    maxCrossAxisExtent: 300.w,
                    mainAxisExtent: 245.h,
                  ),
                  itemBuilder: (context, index) {
                    Test test = testsProvider.selectedTests[index];
                    return GestureDetector(
                      onTap: () {
                        testsProvider.addTestToCart(test);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const CartScreen()));
                      },
                      child: TestContainer(
                        testName: test.testName,
                        numberOfTests: test.numberOfTests,
                        price: test.discountedPrice,
                        totalPrice: test.totalPrice,
                        reportsTime: test.timeOfReport,
                      ),
                    );
                  },
                  itemCount: testsProvider.selectedTests.length,
                );
              }),
              Container(
                margin: EdgeInsets.only(top: 20.h, bottom: 10.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Popular Packages',
                  style: AppStyles.style2,
                ),
              ),
              const PopularPackageWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
