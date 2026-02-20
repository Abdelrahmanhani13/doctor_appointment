import 'package:doctor_appointment/core/utils/app_colors.dart';
import 'package:doctor_appointment/core/utils/app_styles.dart';
import 'package:doctor_appointment/features/home/data/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DoctorDetailView extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorDetailView({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                _buildDoctorInfo(),
                _buildStats(),
                _buildAbout(),
                _buildWorkingTime(),
                SizedBox(height: 100.h),
              ],
            ),
          ),
          _buildBottomButton(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        // Doctor image full width
        Container(
          width: double.infinity,
          height: 300.h,
          color: AppColors.primaryLight,
          child: Image.asset(
            doctor.imageAsset,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: AppColors.primaryLight,
              child: Icon(Icons.person, size: 80.sp, color: AppColors.primary),
            ),
          ),
        ),
        // Back button
        Positioned(
          top: 48.h,
          left: 20.w,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 36.w,
              height: 36.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 16.sp,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),
        // Title
        Positioned(
          top: 52.h,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              doctor.name,
              style: AppStyles.styleMedium14.copyWith(
                fontSize: 15.sp,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDoctorInfo() {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctor.name,
                style: AppStyles.styleSemiBold22.copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: 4.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  doctor.specialty,
                  style: AppStyles.styleRegular12.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          Text(
            doctor.fee,
            style: AppStyles.styleSemiBold22.copyWith(
              color: AppColors.primary,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
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

  Widget _divider() {
    return Container(width: 1, height: 50.h, color: AppColors.border);
  }

  Widget _buildAbout() {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: AppStyles.styleSemiBold22.copyWith(fontSize: 16.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            'Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            style: AppStyles.styleRegular14.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkingTime() {
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
          _workingRow('Monday', '09:00 - 12:00'),
          SizedBox(height: 8.h),
          _workingRow('Friday', '12:00 - 16:00'),
          SizedBox(height: 8.h),
          _workingRow('Saturday', '09:00 - 12:00'),
        ],
      ),
    );
  }

  Widget _workingRow(String day, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          day,
          style: AppStyles.styleMedium14.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          time,
          style: AppStyles.styleMedium14.copyWith(color: AppColors.textPrimary),
        ),
      ],
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 32.h),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () => context.push('/newAppointment', extra: doctor),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.r),
            ),
            minimumSize: Size(double.infinity, 52.h),
            elevation: 0,
          ),
          child: Text('Book Appointment', style: AppStyles.styleSemiBold16),
        ),
      ),
    );
  }
}
