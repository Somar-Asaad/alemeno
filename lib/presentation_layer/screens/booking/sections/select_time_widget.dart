import 'package:alemeno/data_layer/provider_data.dart';
import 'package:alemeno/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SelectTimeWidget extends StatefulWidget {
  const SelectTimeWidget({super.key});

  @override
  State<SelectTimeWidget> createState() => _SelectTimeWidgetState();
}

class _SelectTimeWidgetState extends State<SelectTimeWidget> {
  int selectedSlotIndex = -1; // -1 indicates no selection initially

  List<TimeSlot> timeSlots = List.generate(
    12, // 4 rows, 3 slots in each row
    (index) => TimeSlot(
      time: TimeOfDay(hour: 8 + index, minute: 0),
      isSelected: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 60.h,
      ),
      itemCount: timeSlots.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              if (selectedSlotIndex == index) {
                // Same cell pressed again, unselect
                timeSlots[selectedSlotIndex].isSelected = false;
                selectedSlotIndex = -1;

                // Unselect the time in the provider
                Provider.of<TestsProvider>(context, listen: false)
                    .selectDateTime(
                        Provider.of<TestsProvider>(context, listen: false)
                            .selectedDate!,
                        null); // Use the selectDateTime method
              } else {
                // New cell pressed
                if (selectedSlotIndex != -1) {
                  // Unselect the previously selected cell
                  timeSlots[selectedSlotIndex].isSelected = false;
                }

                selectedSlotIndex = index;
                timeSlots[selectedSlotIndex].isSelected = true;

                // Select the time in the provider
                Provider.of<TestsProvider>(context, listen: false)
                    .selectDateTime(
                        Provider.of<TestsProvider>(context, listen: false)
                            .selectedDate!,
                        timeSlots[selectedSlotIndex]
                            .time
                            .format(context)); // Use the selectDateTime method
              }
            });
          },
          child: Container(
            margin: EdgeInsets.all(8.0.r),
            decoration: BoxDecoration(
              color: timeSlots[index].isSelected
                  ? AppStyles.primaryColor
                  : Colors.white,
              border: Border.all(
                color: timeSlots[index].isSelected
                    ? Colors.transparent
                    : AppStyles.primaryColor,
                width: 2.0.w,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                timeSlots[index].time.format(context),
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14.0.sp,
                  fontWeight: FontWeight.w400,
                  color:
                      timeSlots[index].isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class TimeSlot {
  TimeOfDay time;
  bool isSelected;

  TimeSlot({
    required this.time,
    this.isSelected = false,
  });
}
