import 'package:doctor_appointment/core/utils/app_colors.dart';
import 'package:doctor_appointment/core/utils/app_images.dart';
import 'package:doctor_appointment/core/utils/app_styles.dart';
import 'package:doctor_appointment/features/home/data/models/doctor_model.dart';
import 'package:doctor_appointment/features/home/presentation/widgets/category_doctor_card.dart';
import 'package:doctor_appointment/features/home/presentation/widgets/filter_bottom_sheet.dart';
import 'package:doctor_appointment/features/home/presentation/widgets/sort_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryDetailView extends StatelessWidget {
  final String? categoryName;

  const CategoryDetailView({super.key, this.categoryName});

  static final List<DoctorModel> _doctors = [
    DoctorModel(
      name: 'Dr. Ayesha Rahman',
      specialty: 'Dentist',
      rating: 5.0,
      reviews: 200,
      fee: '\$15/hr',
      imageAsset: Assets.imagesDrAyeshaRahman,
    ),
    DoctorModel(
      name: 'Estelle Vasquez',
      specialty: 'Dentist',
      rating: 5.0,
      reviews: 200,
      fee: '\$18/hr',
      imageAsset: Assets.imagesDrSarah,
    ),
    DoctorModel(
      name: 'Bob Stone',
      specialty: 'Dentist',
      rating: 5.0,
      reviews: 200,
      fee: '\$12/hr',
      imageAsset: Assets.imagesDrNobleThorme,
    ),
    DoctorModel(
      name: 'Jacob Graves',
      specialty: 'Dentist',
      rating: 5.0,
      reviews: 200,
      fee: '\$20/hr',
      imageAsset: Assets.imagesDrAyeshaRahman,
    ),
    DoctorModel(
      name: 'Meredith Grant',
      specialty: 'Dentist',
      rating: 5.0,
      reviews: 200,
      fee: '\$17/hr',
      imageAsset: Assets.imagesDrSarah,
    ),
    DoctorModel(
      name: 'Misty Gray',
      specialty: 'Dentist',
      rating: 5.0,
      reviews: 200,
      fee: '\$14/hr',
      imageAsset: Assets.imagesDrNobleThorme,
    ),
    DoctorModel(
      name: 'Margie Dawson',
      specialty: 'Dentist',
      rating: 5.0,
      reviews: 200,
      fee: '\$16/hr',
      imageAsset: Assets.imagesDrAyeshaRahman,
    ),
  ];

  void _showSortSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const SortBottomSheet(),
    );
  }

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => FilterBottomSheet(categoryName: categoryName ?? ''),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _buildSearchAndFilter(context),
          _buildResultsHeader(context),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
              itemCount: _doctors.length,
              separatorBuilder: (_, __) => SizedBox(height: 12.h),
              itemBuilder: (_, index) =>
                  CategoryDoctorCard(doctor: _doctors[index]),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          margin: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: AppColors.bg,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.textPrimary,
            size: 16.sp,
          ),
        ),
      ),
      title: Text(
        categoryName ?? '',
        style: AppStyles.styleSemiBold22.copyWith(fontSize: 18.sp),
      ),
    );
  }

  Widget _buildSearchAndFilter(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 46.h,
              decoration: BoxDecoration(
                color: AppColors.bg,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Find the right doctor for you...',
                  hintStyle: AppStyles.styleRegular14.copyWith(
                    color: AppColors.textLight,
                    fontSize: 12.sp,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.textLight,
                    size: 18.sp,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 13.h),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: () => _showFilterSheet(context),
            child: Container(
              width: 46.w,
              height: 46.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12.r),
              ),
              // FIX: alignment بدل Center
              alignment: Alignment.center,
              child: SvgPicture.asset(Assets.imagesFilterIcon),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '114 Found for "$categoryName"',
            style: AppStyles.styleRegular14.copyWith(
              color: AppColors.textSecondary,
              fontSize: 12.sp,
            ),
          ),
          // FIX: showModalBottomSheet بدل router.go
          GestureDetector(
            onTap: () => _showSortSheet(context),
            child: Row(
              children: [
                Text(
                  'Sort by',
                  style: AppStyles.styleRegular14.copyWith(
                    color: AppColors.primary,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(
                  Icons.swap_vert_rounded,
                  color: AppColors.primary,
                  size: 16.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
