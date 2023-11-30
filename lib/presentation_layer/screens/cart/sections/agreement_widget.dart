import 'package:alemeno/data_layer/provider_data.dart';
import 'package:alemeno/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remixicon/remixicon.dart';
import 'package:provider/provider.dart';



class AgreementWidget extends StatefulWidget {
  const AgreementWidget({super.key});

  @override
  State<AgreementWidget> createState() => _AgreementWidgetState();
}

class _AgreementWidgetState extends State<AgreementWidget> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.r),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isPressed = !isPressed;
                });

                // Access the provider and update the hard copy selection
                Provider.of<TestsProvider>(context, listen: false)
                    .toggleHardCopySelection();
              },
              child: isPressed
                  ? SizedBox(
                width: 20.0.w,
                height: 20.0.h,
                child: Icon(
                  Remix.checkbox_circle_fill,
                  color: AppStyles.primaryColor,
                ),
              )
                  : Container(
                width: 20.0.w,
                height: 20.0.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.0.w,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hard copy of reports ',
                  style: AppStyles.style6.copyWith(color: Colors.black87),
                ),
                SizedBox(height: 8.0.h), // Small vertical space
                Text(
                  'Reports will be delivered within 3-4 working days. Hard copy charges are non-refundable once the reports have been dispatched.',
                  style: AppStyles.style4,
                ),
                SizedBox(height: 8.0.h), // Small vertical space
                Text(
                  '₹150 per person',
                  style: AppStyles.style4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
