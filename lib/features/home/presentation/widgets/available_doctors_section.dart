import 'package:doctor_appointment/core/utils/app_colors.dart';
import 'package:doctor_appointment/core/utils/app_images.dart';
import 'package:doctor_appointment/core/utils/app_styles.dart';
import 'package:doctor_appointment/core/utils/go_router.dart';
import 'package:doctor_appointment/features/home/data/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailableDoctorsSection extends StatelessWidget {
  const AvailableDoctorsSection({super.key});

  static final List<DoctorModel> _doctors = [
    DoctorModel(
      name: 'Dr. Sarah',
      specialty: 'Dentist',
      rating: 4.9,
      reviews: 150,
      fee: '\$20/hr',
      imageAsset: Assets.imagesDrSarah,
    ),
    DoctorModel(
      name: 'Dr. Noble Thorme',
      specialty: 'ENT Specialist',
      rating: 4.7,
      reviews: 120,
      fee: '\$22/hr',
      imageAsset: Assets.imagesDrNobleThorme,
    ),
    DoctorModel(
      name: 'Dr. Ayesha Rahman',
      specialty: 'Ophthalmologist',
      rating: 5.0,
      reviews: 200,
      fee: '\$15/hr',
      imageAsset: Assets.imagesDrAyeshaRahman,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSectionHeader(),
        SizedBox(height: 14.h),
        SizedBox(
          height: 180.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _doctors.length,
            separatorBuilder: (_, __) => SizedBox(width: 12.w),
            itemBuilder: (_, index) =>
                _AvailableDoctorCard(doctor: _doctors[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Available Doctors',
          style: AppStyles.styleSemiBold22.copyWith(fontSize: 16.sp),
        ),
        GestureDetector(
          onTap: () => AppRouter.router.push(AppRouter.kCategoryDetailsView),
          child: Text(
            'See all',
            style: AppStyles.styleRegular14.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}

class _AvailableDoctorCard extends StatelessWidget {
  final DoctorModel doctor;

  const _AvailableDoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          AppRouter.router.push(AppRouter.kDoctorDetail, extra: doctor),
      child: Container(
        width: 130.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                child: Image.asset(
                  doctor.imageAsset,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    style: AppStyles.styleMedium14.copyWith(fontSize: 11.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    doctor.specialty,
                    style: AppStyles.styleRegular12.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: AppColors.star,
                        size: 11.sp,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        '${doctor.rating}',
                        style: AppStyles.styleRegular12.copyWith(
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
