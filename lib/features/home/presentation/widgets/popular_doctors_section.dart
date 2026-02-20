import 'package:doctor_appointment/core/utils/app_colors.dart';
import 'package:doctor_appointment/core/utils/app_images.dart';
import 'package:doctor_appointment/core/utils/app_styles.dart';
import 'package:doctor_appointment/core/utils/go_router.dart';
import 'package:doctor_appointment/features/home/data/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularDoctorsSection extends StatelessWidget {
  const PopularDoctorsSection({super.key});

  static final List<DoctorModel> _doctors = [
    DoctorModel(
      name: 'Dr. Ayesha Rahman',
      specialty: 'Dentist',
      rating: 5.0,
      reviews: 200,
      fee: '\$15/hr',
      imageAsset: Assets.imagesDrAyeshaRahman,
      isFavorite: true,
    ),
    DoctorModel(
      name: 'Dr. Noble Thorme',
      specialty: 'Ophthalmologist',
      rating: 4.8,
      reviews: 180,
      fee: '\$18/hr',
      imageAsset: Assets.imagesDrNobleThorme,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSectionHeader(),
        SizedBox(height: 14.h),
        ..._doctors.map(
          (doctor) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: _PopularDoctorCard(doctor: doctor),
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
          'Popular Doctors',
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

class _PopularDoctorCard extends StatelessWidget {
  final DoctorModel doctor;

  const _PopularDoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          AppRouter.router.push(AppRouter.kDoctorDetail, extra: doctor),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              doctor.imageAsset,
              width: 70.w,
              height: 70.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.name,
                  style: AppStyles.styleMedium14.copyWith(fontSize: 15.sp),
                ),
                SizedBox(height: 2.h),
                Text(
                  doctor.specialty,
                  style: AppStyles.styleRegular12.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: AppColors.star,
                      size: 14.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '${doctor.rating} (${doctor.reviews} Reviews)',
                      style: AppStyles.styleRegular12.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                doctor.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: doctor.isFavorite
                    ? AppColors.accent
                    : AppColors.textLight,
                size: 20.sp,
              ),
              SizedBox(height: 8.h),
              Text(
                doctor.fee,
                style: AppStyles.styleMedium14.copyWith(
                  color: AppColors.primary,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ],
        ),
      ),
    );
  }
}
