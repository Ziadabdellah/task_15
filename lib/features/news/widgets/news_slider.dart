import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_15/core/utils/app_colors.dart';

class Slider_news extends StatefulWidget {
  const Slider_news({super.key});

  @override
  State<Slider_news> createState() => _Slider_newsState();
}

class _Slider_newsState extends State<Slider_news> {
  int PageContr = 0;
  List<Widget> images = [
    ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          'assets/asd.jpg',
          height: 170,
          width: 400,
          fit: BoxFit.cover,
        )),
    ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          'assets/asd.jpg',
          height: 170,
          width: 400,
          fit: BoxFit.cover,
        )),
    ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          'assets/asd.jpg',
          height: 170,
          width: 400,
          fit: BoxFit.cover,
        )),
    ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          'assets/asd.jpg',
          height: 170,
          width: 400,
          fit: BoxFit.cover,
        )),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            items: images,
            options: CarouselOptions(
              height: 170,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, reason) {
                setState(() {
                  PageContr = index;
                });
              },
              scrollDirection: Axis.horizontal,
            )),
        Gap(10),
        SmoothPageIndicator(
          controller: PageController(initialPage: PageContr),
          count: images.length,
          axisDirection: Axis.horizontal,
          effect: ScaleEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: AppColors.whiteColor),
        )
      ],
    );
  }
}
