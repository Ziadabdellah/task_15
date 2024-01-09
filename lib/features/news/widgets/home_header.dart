import 'dart:io';

import 'package:flutter/material.dart';

import 'package:task_15/core/storage/local_storage.dart';
import 'package:task_15/core/utils/app_colors.dart';
import 'package:task_15/core/utils/styles.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({super.key});

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
  String name = '';
  String? imagePath;
  @override
  void initState() {
    super.initState();
    AppLocalStorage.getCachedData(AppLocalStorage.Name_Key).then((value) {
      setState(() {
        name = value;
      });
    });
    AppLocalStorage.getCachedData(AppLocalStorage.Image_Key).then((value) {
      setState(() {
        imagePath = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(children: [
              TextSpan(text: 'Hello, ', style: getTitleStyle(fontSize: 18)),
              TextSpan(
                  text: name,
                  style:
                      getTitleStyle(fontSize: 18, color: AppColors.whiteColor)),
            ])),
            Text(
              'Have a nice day',
              style: getBodyStyle(fontSize: 14),
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.whiteColor,
          backgroundImage: (imagePath != null)
              ? FileImage(File(imagePath!)) as ImageProvider
              : const AssetImage('assets/asd.png'),
        ),
      ],
    );
  }
}
