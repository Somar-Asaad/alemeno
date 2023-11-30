import 'package:alemeno/presentation_layer/screens/home_page/home_page.dart';
import 'package:alemeno/presentation_layer/widgets/custome_elevated_button.dart';
import 'package:alemeno/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:alemeno/data_layer/provider_data.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TestsProvider testsProvider = Provider.of<TestsProvider>(context);

    // Get the selected date and time from the provider
    DateTime? selectedDate = testsProvider.selectedDate;
    String? selectedTime = testsProvider.selectedTime;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Clear the data in the provider
            testsProvider.selectDateTime(null, null);
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Success',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
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
        padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 20.w),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 30.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.shade50,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/calender.png',
                    scale: 3.5.r,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    'Lab tests have been scheduled successfully. You will receive a mail of the same.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(15, 23, 42, 1),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // Check if selectedDate and selectedTime are not null before using them
                  if (selectedDate != null && selectedTime != null)
                    Text(
                      '${DateFormat('dd MMM yyyy').format(selectedDate)} | $selectedTime',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(102, 112, 133, 1),
                      ),
                    )
                ],
              ),
            ),
            const Spacer(),
            CustomContainer(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              width: double.infinity,
              backgroundColor: AppStyles.primaryColor,
              text: 'Back to home',
              onTap: () {
                // Clear the data in the provider and navigate to the home screen
                testsProvider.selectDateTime(null, null);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (ctx) => const HomePageScreen()));
              },
              fontColor: Colors.white,
              borderColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
