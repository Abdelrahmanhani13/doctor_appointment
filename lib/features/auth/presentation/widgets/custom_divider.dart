import 'package:doctor_appointment/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: const Color(0xFFDADADA), thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(
            'Or continue with',
            style: AppStyles.styleRegular14.copyWith(
              color: const Color(0xFF949D9E),
            ),
          ),
        ),
        Expanded(child: Divider(color: const Color(0xFFDADADA), thickness: 1)),
      ],
    );
  }
}
