
import 'package:alemeno/data_layer/provider_data.dart';
import 'package:alemeno/presentation_layer/screens/booking/book_appointment_screen.dart';
import 'package:alemeno/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SelectTimeDateWidget extends StatelessWidget {
  const SelectTimeDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
      margin: EdgeInsets.only(top: 10.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.calendar_month_outlined,
            size: 35.r,
            color: Colors.black87,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const BookAppointmentScreen()),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: Consumer<TestsProvider>(
                  builder: (context, testsProvider, child) {
                    // Check if date and time are selected
                    if (testsProvider.selectedDate != null &&
                        testsProvider.selectedTime != null) {
                      // Format the date and time
                      String formattedDateTime =
                          '${testsProvider.selectedDate!.month}/${testsProvider.selectedDate!.day}/${testsProvider.selectedDate!.year}   (${testsProvider.selectedTime})';
                      return Text(
                        formattedDateTime,
                        style: TextStyle(
                          color: AppStyles.primaryColor,
                        ),
                      );
                    } else {
                      return Text(
                        'Select date',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
