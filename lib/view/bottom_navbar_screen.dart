import 'package:flutter/material.dart';
import 'package:gluco_track/view/articles_screen.dart';
import 'package:gluco_track/view/pdf_report_screen.dart';
import 'package:gluco_track/view/profile_screen.dart';
import 'package:gluco_track/view/settings_screen.dart';
import 'package:gluco_track/view/splash_screen.dart';
import 'package:gluco_track/view/userinput_screen.dart';

import '../utils/constants/app_colors.dart';
import 'home_screen.dart';

class BottomNavbarScreen extends StatefulWidget {
  final int initialIndex;
  const BottomNavbarScreen({super.key, this.initialIndex = 0});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  late int selectedState;

  @override
  void initState() {
    super.initState();
    selectedState = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          selectedState = 0;
        });
        return false;
      },
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false, // Prevent resizing when the keyboard opens
            body: IndexedStack(
              index: selectedState,
              children: [
                HomeScreen(),
                PdfReportScreen(),
                UserInputScreen(),
                ArticlesScreen(),
                SettingsScreen(),
              ],
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  selectedItemColor: AppColors.primaryColor,
                  unselectedItemColor: AppColors.defaultfont,
                  currentIndex: selectedState,
                  onTap: (index) {
                    if (index != 2) {
                      setState(() {
                        selectedState = index;
                      });
                    }
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.picture_as_pdf),
                      label: 'PDF',
                    ),
                    BottomNavigationBarItem(
                      icon: SizedBox.shrink(),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.article),
                      label: 'Articles',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20, // Adjust position if needed
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    selectedState = 2;
                  });
                },
                backgroundColor: AppColors.primaryColor,
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
