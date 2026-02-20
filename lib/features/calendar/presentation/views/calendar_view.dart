import 'package:doctor_appointment/core/utils/app_colors.dart';
import 'package:doctor_appointment/core/utils/app_images.dart';
import 'package:doctor_appointment/core/utils/app_styles.dart';
import 'package:doctor_appointment/features/calendar/presentation/widgets/appointment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const List<Map<String, String>> _appointments = [
    {
      'name': 'Margie Dawson',
      'specialty': 'ENT',
      'date': '15 Nov, 2023',
      'time': '16:00',
      'imageAsset': Assets.imagesDrAyeshaRahman,
    },
    {
      'name': 'Margie Dawson',
      'specialty': 'ENT',
      'date': '15 Nov, 2023',
      'time': '12:00',
      'imageAsset': Assets.imagesDrSarah,
    },
    {
      'name': 'Margie Dawson',
      'specialty': 'ENT',
      'date': '15 Nov, 2023',
      'time': '16:45',
      'imageAsset': Assets.imagesDrNobleThorme,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Appointments',
          style: AppStyles.styleSemiBold22.copyWith(fontSize: 18.sp),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(44.h),
          child: TabBar(
            controller: _tabController,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textSecondary,
            indicatorColor: AppColors.primary,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: AppStyles.styleMedium14.copyWith(fontSize: 13.sp),
            tabs: const [
              Tab(text: 'Upcoming'),
              Tab(text: 'Completed'),
              Tab(text: 'Cancelled'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildList(),
          _buildList(isCompleted: true),
          _buildList(isCancelled: true),
        ],
      ),
    );
  }

  Widget _buildList({bool isCompleted = false, bool isCancelled = false}) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      itemCount: _appointments.length,
      separatorBuilder: (_, __) => SizedBox(height: 14.h),
      itemBuilder: (_, index) => AppointmentCard(
        name: _appointments[index]['name']!,
        specialty: _appointments[index]['specialty']!,
        date: _appointments[index]['date']!,
        time: _appointments[index]['time']!,
        imageAsset: _appointments[index]['imageAsset']!,
        isCompleted: isCompleted,
        isCancelled: isCancelled,
      ),
    );
  }
}
