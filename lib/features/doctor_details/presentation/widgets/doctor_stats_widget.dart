import 'package:doctor_appointment/core/utils/app_colors.dart';
import 'package:doctor_appointment/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorStatsWidget extends StatelessWidget {
  const DoctorStatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _statItem('1000+', 'Patients', Icons.people_outline_rounded),
          _divider(),
          _statItem('10 Yrs', 'Experience', Icons.workspace_premium_outlined),
          _divider(),
          _statItem('4.5', 'Ratings', Icons.star_outline_rounded),
        ],
      ),
    );
  }

  Widget _statItem(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary, size: 22.sp),
        SizedBox(height: 4.h),
        Text(value, style: AppStyles.styleSemiBold22.copyWith(fontSize: 14.sp)),
        Text(
          label,
          style: AppStyles.styleRegular12.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _divider() =>
      Container(width: 1, height: 50.h, color: AppColors.border);
}
