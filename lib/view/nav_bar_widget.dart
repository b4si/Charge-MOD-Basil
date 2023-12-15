// ignore_for_file: library_private_types_in_public_api

import 'package:charge_mod_task/view/activity_screen.dart';
import 'package:charge_mod_task/view/community_screen.dart';
import 'package:charge_mod_task/view/home_screen.dart';
import 'package:charge_mod_task/view/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ActivityScreen(),
    const CommunityScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.other_houses_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo_outlined,
              // color: Colors.black,
            ),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.crisis_alert_outlined,
              // ? color: Colors.black,
            ),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              // color: Colors.black,
            ),
            label: 'Profile',
          ),
        ],
        elevation: 15,
        selectedItemColor: const Color(0xFFE6740C),
        iconSize: 28,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        showSelectedLabels: true,
      ),
    );
  }
}
