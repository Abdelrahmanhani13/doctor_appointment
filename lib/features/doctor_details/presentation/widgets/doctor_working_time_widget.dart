import 'package:doctor_appointment/core/utils/app_colors.dart';
import 'package:doctor_appointment/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorWorkingTimeWidget extends StatelessWidget {
  const DoctorWorkingTimeWidget({super.key});

  static const List<Map<String, String>> _workingDays = [
    {'day': 'Monday', 'time': '09:00 - 12:00'},
    {'day': 'Friday', 'time': '12:00 - 16:00'},
    {'day': 'Saturday', 'time': '09:00 - 12:00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Working Time',
            style: AppStyles.styleSemiBold22.copyWith(fontSize: 16.sp),
          ),
          SizedBox(height: 12.h),
          ..._workingDays.map(
            (w) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    w['day']!,
                    style: AppStyles.styleMedium14.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Text(w['time']!, style: AppStyles.styleMedium14),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
