import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_15/core/storage/local_storage.dart';

import 'package:task_15/core/utils/app_colors.dart';
import 'package:task_15/core/utils/styles.dart';
import 'package:task_15/features/home/Nav_bar.dart';
import 'package:task_15/features/upload/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool? isUpload;
  @override
  void initState() {
    super.initState();

    AppLocalStorage.getCachedData(AppLocalStorage.IS_UPLOAD).then((value) {
      setState(() {
        isUpload = value ?? false;
      });
      print(value);
      print(isUpload);
    });
    // delay by 4 sec and navigate to upload
    Future.delayed(const Duration(seconds: 4), () {
      // navigation
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => isUpload! ? Nav_Bar() : UploadView(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/asd.jpg', width: 250),
          const Gap(10),
          Text(
            'Insights News',
            style: getBodyStyle(fontSize: 26),
          ),
          // const SizedBox(height: 10),
          
        ],
      )),
    );
  }
}
