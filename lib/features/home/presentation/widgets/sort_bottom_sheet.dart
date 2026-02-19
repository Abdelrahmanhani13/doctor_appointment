import 'package:doctor_appointment/core/utils/app_colors.dart';
import 'package:doctor_appointment/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SortBottomSheet extends StatefulWidget {
  const SortBottomSheet({super.key});

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  final List<String> _options = [
    'Full Name (A - Z)',
    'Experience (High ↑ Low)',
    'Rating (High ↑ Low)',
    'Fee (Low → High)',
    'Availability',
  ];

  final Set<String> _selected = {'Full Name (A - Z)'};

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 32.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Sort by',
            style: AppStyles.styleSemiBold22.copyWith(fontSize: 18.sp),
          ),
          SizedBox(height: 16.h),
          ..._options.map((option) => _buildOption(option)),
          SizedBox(height: 20.h),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildOption(String option) {
    final bool isSelected = _selected.contains(option);
    return GestureDetector(
      onTap: () => setState(() {
        if (isSelected) {
          _selected.remove(option);
        } else {
          _selected.add(option);
        }
      }),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.textLight,
                ),
              ),
              child: isSelected
                  ? Icon(Icons.check, color: Colors.white, size: 13.sp)
                  : null,
            ),
            SizedBox(width: 12.w),
            Text(
              option,
              style: AppStyles.styleMedium14.copyWith(
                color: isSelected ? AppColors.primary : AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              setState(() => _selected.clear());
              Navigator.pop(context);
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: AppColors.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 14.h),
            ),
            child: Text(
              'Clear',
              style: AppStyles.styleMedium14.copyWith(color: AppColors.primary),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 14.h),
              elevation: 0,
            ),
            child: Text('Filter', style: AppStyles.styleSemiBold16),
          ),
        ),
      ],
    );
  }
}
