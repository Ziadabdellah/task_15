import 'package:flutter/material.dart';
import 'package:task_15/core/utils/app_colors.dart';
import 'package:task_15/features/news/news_view.dart';
import 'package:task_15/features/profile/profile.view.dart';
import 'package:task_15/features/search/search_view.dart';
import 'package:task_15/features/source/source_view.dart';

class Nav_Bar extends StatefulWidget {
  const Nav_Bar({super.key});

  @override
  State<Nav_Bar> createState() => _Nav_BarState();
}

class _Nav_BarState extends State<Nav_Bar> {
  List<Widget> screans = [
    News_view(),
    Search_view(),
    source_view(),
    ProfileView(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: screans[currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.appbarColor,
          selectedItemColor: AppColors.whiteColor,
          unselectedItemColor: AppColors.dark,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Source'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile')
          ],
        ));
  }
}
