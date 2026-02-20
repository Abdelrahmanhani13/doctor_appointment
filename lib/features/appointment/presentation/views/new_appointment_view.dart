import 'package:doctor_appointment/core/utils/app_colors.dart';
import 'package:doctor_appointment/core/utils/app_styles.dart';
import 'package:doctor_appointment/features/home/data/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class NewAppointmentView extends StatefulWidget {
  final DoctorModel doctor;
  const NewAppointmentView({super.key, required this.doctor});

  @override
  State<NewAppointmentView> createState() => _NewAppointmentViewState();
}

class _NewAppointmentViewState extends State<NewAppointmentView> {
  DateTime _selectedDate = DateTime(2020, 7, 14);
  String _selectedConsultation = 'Hospital';
  String _selectedSlot = 'Morning';
  String _selectedTime = '10:00';

  final List<String> _consultationTypes = ['Online', 'Home visit', 'Hospital'];
  final List<String> _slots = ['Morning', 'Afternoon', 'Night'];
  final List<String> _times = ['09:00', '09:30', '10:00', '11:00'];

  final Map<String, double> _fees = {
    'Online': 10,
    'Home visit': 20,
    'Video Call': 30,
  };

  List<DateTime> get _weekDays {
    final start = DateTime(2020, 7, 13);
    return List.generate(4, (i) => start.add(Duration(days: i)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
              size: 16.sp,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        title: Text(
          'New Appointment',
          style: AppStyles.styleSemiBold22.copyWith(fontSize: 18.sp),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                _buildMonthSelector(),
                SizedBox(height: 16.h),
                _buildDatePicker(),
                SizedBox(height: 24.h),
                _buildSectionTitle('Consultation Type'),
                SizedBox(height: 12.h),
                _buildConsultationType(),
                SizedBox(height: 24.h),
                _buildSectionTitle('Available Slots'),
                SizedBox(height: 12.h),
                _buildSlots(),
                SizedBox(height: 16.h),
                _buildSectionTitle('Available Time'),
                SizedBox(height: 12.h),
                _buildTimes(),
                SizedBox(height: 24.h),
                _buildSectionTitle('Consultation Fees'),
                SizedBox(height: 12.h),
                _buildFees(),
                SizedBox(height: 100.h),
              ],
            ),
          ),
          _buildBottomButton(context),
        ],
      ),
    );
  }

  Widget _buildMonthSelector() {
    return Row(
      children: [
        Text(
          DateFormat('MMMM, yyyy').format(_selectedDate),
          style: AppStyles.styleMedium14.copyWith(fontSize: 15.sp),
        ),
        SizedBox(width: 4.w),
        Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColors.textSecondary,
          size: 18.sp,
        ),
      ],
    );
  }

  Widget _buildDatePicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _weekDays.map((date) {
        final isSelected = date.day == _selectedDate.day;
        return GestureDetector(
          onTap: () => setState(() => _selectedDate = date),
          child: Container(
            width: 60.w,
            height: 72.h,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.bg,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${date.day}',
                  style: AppStyles.styleSemiBold22.copyWith(
                    fontSize: 20.sp,
                    color: isSelected ? Colors.white : AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  DateFormat('EEE').format(date).toUpperCase(),
                  style: AppStyles.styleRegular12.copyWith(
                    fontSize: 10.sp,
                    color: isSelected
                        ? Colors.white70
                        : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppStyles.styleSemiBold22.copyWith(fontSize: 15.sp),
    );
  }

  Widget _buildConsultationType() {
    final icons = {
      'Online': Icons.laptop_mac_outlined,
      'Home visit': Icons.home_outlined,
      'Hospital': Icons.local_hospital_outlined,
    };
    return Row(
      children: _consultationTypes.map((type) {
        final isSelected = _selectedConsultation == type;
        return GestureDetector(
          onTap: () => setState(() => _selectedConsultation = type),
          child: Container(
            margin: EdgeInsets.only(right: 10.w),
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.bg,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.border,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icons[type],
                  size: 14.sp,
                  color: isSelected ? Colors.white : AppColors.textSecondary,
                ),
                SizedBox(width: 4.w),
                Text(
                  type,
                  style: AppStyles.styleRegular12.copyWith(
                    color: isSelected ? Colors.white : AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSlots() {
    final icons = {
      'Morning': Icons.wb_sunny_outlined,
      'Afternoon': Icons.wb_cloudy_outlined,
      'Night': Icons.nightlight_outlined,
    };
    return Row(
      children: _slots.map((slot) {
        final isSelected = _selectedSlot == slot;
        return GestureDetector(
          onTap: () => setState(() => _selectedSlot = slot),
          child: Container(
            margin: EdgeInsets.only(right: 10.w),
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.bg,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.border,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icons[slot],
                  size: 14.sp,
                  color: isSelected ? Colors.white : AppColors.star,
                ),
                SizedBox(width: 4.w),
                Text(
                  slot,
                  style: AppStyles.styleRegular12.copyWith(
                    color: isSelected ? Colors.white : AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTimes() {
    return Row(
      children: _times.map((time) {
        final isSelected = _selectedTime == time;
        return GestureDetector(
          onTap: () => setState(() => _selectedTime = time),
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

  Widget _buildFees() {
    final labels = ['Online Call', 'Home Visit', 'Video Call'];
    final amounts = ['\$10', '\$20', '\$30'];
    final icons = [
      Icons.call_outlined,
      Icons.home_outlined,
      Icons.videocam_outlined,
    ];
    return Row(
      children: List.generate(3, (i) {
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(right: i < 2 ? 10.w : 0),
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.bg,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              children: [
                Icon(icons[i], color: AppColors.primary, size: 20.sp),
                SizedBox(height: 4.h),
                Text(
                  amounts[i],
                  style: AppStyles.styleSemiBold22.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  labels[i],
                  style: AppStyles.styleRegular12.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 10.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      }),
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
          onPressed: () =>
              context.push('/patientDetails', extra: widget.doctor),
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
