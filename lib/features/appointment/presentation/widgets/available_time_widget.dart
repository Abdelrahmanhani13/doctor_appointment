import 'package:doctor_appointment/core/utils/app_colors.dart';
import 'package:doctor_appointment/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailableTimeWidget extends StatelessWidget {
  final String selectedTime;
  final ValueChanged<String> onTimeSelected;

  const AvailableTimeWidget({
    super.key,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  static const List<String> times = ['09:00', '09:30', '10:00', '11:00'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: times.map((time) {
        final isSelected = selectedTime == time;
        return GestureDetector(
          onTap: () => onTimeSelected(time),
          child: Container(
            margin: EdgeInsets.only(right: 10.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.bg,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.border,
              ),
            ),
            child: Text(
              time,
              style: AppStyles.styleRegular12.copyWith(
                color: isSelected ? Colors.white : AppColors.textPrimary,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
