import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_15/features/news/widgets/home_header.dart';
import 'package:task_15/features/news/widgets/news_categry.dart';
import 'package:task_15/features/news/widgets/news_slider.dart';

class News_view extends StatefulWidget {
  const News_view({super.key});

  @override
  State<News_view> createState() => _News_viewState();
}

class _News_viewState extends State<News_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: HomeHeaderWidget(),
        ),
        Gap(20),
        Slider_news(),
        Gap(20),
        tap_G()
      ]),
    );
  }
}
