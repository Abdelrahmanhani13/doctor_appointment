import 'package:doctor_appointment/features/calendar/presentation/views/calendar_view.dart';
import 'package:doctor_appointment/features/favorite/presentation/views/favorite_view.dart';
import 'package:doctor_appointment/features/home/presentation/views/home_view.dart';
import 'package:doctor_appointment/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _currentIndex = 0;
  final List<Widget> _widgetOptions = [
    HomeView(),
    FavoriteView(),
    CalendarView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xff226CEB),
        // ignore: deprecated_member_use
        unselectedItemColor: Color(0xff226CEB).withOpacity(0.2),
        onTap: _changeItem,
        unselectedIconTheme: IconThemeData(
          color: Color(0xff226CEB).withOpacity(0.2),
        ),
      ),
    );
  }

  void _changeItem(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
