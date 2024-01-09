import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:task_15/features/news/widgets/news_list_builder.dart';

class tap_G extends StatefulWidget {
  const tap_G({super.key});

  @override
  State<tap_G> createState() => _tap_GState();
}

class _tap_GState extends State<tap_G> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Expanded(
          child: Column(
            children: [
              ButtonsTabBar(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                buttonMargin: EdgeInsets.symmetric(horizontal: 17),
                backgroundColor: Colors.red,
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: TextStyle(color: Colors.black),
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                tabs: [
                  Tab(
                    text: "Sports",
                  ),
                  Tab(
                    text: "Science",
                  ),
                  Tab(
                    text: "Business",
                  ),
                  Tab(
                    text: "Entertainment",
                  ),
                ],
              ),
              Gap(20),
              Expanded(
                child: TabBarView(
                  children: [
                    news_list_buli('Sports'),
                    news_list_buli('Science'),
                    news_list_buli('Business'),
                    news_list_buli('Entertainment'),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
// 140
