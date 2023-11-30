import 'package:alemeno/data_layer/provider_data.dart';
import 'package:alemeno/presentation_layer/screens/booking/sections/select_time_widget.dart';
import 'package:alemeno/presentation_layer/screens/cart/cart_screen.dart';
import 'package:alemeno/presentation_layer/widgets/custome_elevated_button.dart';
import 'package:alemeno/utils/app_styles.dart';
import 'package:intl/intl.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];
  final config = CalendarDatePicker2Config(
    selectedDayHighlightColor: AppStyles.primaryColor,
    weekdayLabels: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
    nextMonthIcon: Icon(
      Icons.arrow_forward_ios,
      color: AppStyles.primaryColor,
    ),
    lastMonthIcon: Icon(
      Icons.arrow_back_ios,
      color: AppStyles.primaryColor,
    ),
    dayTextStyle:
        TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade600),
    weekdayLabelTextStyle: TextStyle(
      color: Colors.grey.shade400,
      fontWeight: FontWeight.w600,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Book Appointment'),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Date',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      offset: const Offset(-10, -10),
                      blurRadius: 5,
                    ),
                    BoxShadow(
                      color: Colors.grey.shade100,
                      offset: const Offset(10, 10),
                      blurRadius: 5,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CalendarDatePicker2(
                  config: config,
                  value: _singleDatePickerValueWithDefaultValue,
                  onValueChanged: (dates) => setState(() {
                    _singleDatePickerValueWithDefaultValue = dates;
                    String formattedDate =
                        DateFormat('MM/dd/yyyy').format(dates[0]!);
                    Provider.of<TestsProvider>(context, listen: false)
                        .selectDateTime(
                            dates[0]!, null); // Use the selectDateTime method
                    debugPrint(formattedDate);
                  }),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Text(
                'Select Time',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              const SelectTimeWidget(),
              SizedBox(
                height: 25.h,
              ),
              Consumer<TestsProvider>(
                builder: (context, testsProvider, child) {
                  String buttonText;
                  Color buttonColor;

                  if (testsProvider.selectedDate != null) {
                    if (testsProvider.selectedTime != null) {
                      // Both date and time are selected
                      buttonText = 'Confirm';
                      buttonColor = AppStyles.primaryColor;
                    } else {
                      // Only date is selected
                      buttonText = 'Next';
                      buttonColor = Colors.grey.shade300;
                    }
                  } else {
                    // No date is selected
                    buttonText = 'Next';
                    buttonColor = Colors.grey.shade300;
                  }

                  return CustomContainer(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    width: double.infinity,
                    borderRadius: 10,
                    backgroundColor: buttonColor,
                    text: buttonText,
                    onTap: () {
                      if (testsProvider.selectedDate != null &&
                          testsProvider.selectedTime != null) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => const CartScreen(),
                          ),
                        );
                      } else {
                        // Handle next logic
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((pickedTime) {
                          if (pickedTime != null) {
                            String formattedTime =
                                "${pickedTime.hour}:${pickedTime.minute}";
                            testsProvider.selectDateTime(
                              testsProvider.selectedDate!,
                              formattedTime,
                            );
                          }
                        });
                      }
                    },
                    fontColor: Colors.white,
                    borderColor: Colors.transparent,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
