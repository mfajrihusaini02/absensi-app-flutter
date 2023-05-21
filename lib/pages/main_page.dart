import 'package:absensi_app/common/constant.dart';
import 'package:absensi_app/pages/attendance_page.dart';
import 'package:absensi_app/pages/home_page.dart';
import 'package:absensi_app/pages/prayer_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: _onBottomNavTapped,
        selectedLabelStyle: fontStyle1,
        unselectedLabelStyle: fontStyle1,
      ),
    );
  }

  final List<Widget> _listWidget = [
    const HomePage(),
    const AttendancePage(),
    const PrayerPage(),
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.public),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.collections_bookmark),
      label: 'Attendance',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Prayer',
    ),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }
}