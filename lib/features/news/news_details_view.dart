import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:task_15/core/utils/app_colors.dart';
import 'package:task_15/core/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model1/article.dart';

class news_details_vi extends StatelessWidget {
  const news_details_vi({super.key, required this.model});
  final Article model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: AppColors.whiteColor,
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        backgroundColor: AppColors.appbarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: (model.urlToImage == null)
                    ? Center(
                        child: SizedBox(
                            width: double.infinity,
                            height: 150,
                            child: Icon(
                              Icons.error,
                              color: AppColors.whiteColor,
                            )))
                    : Image.network(
                        model.urlToImage,
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      )),
            const Gap(10),
            Text(
              model.title ?? '',
              style: getTitleStyle(fontSize: 16, color: AppColors.whiteColor),
            ),
            const Gap(10),
            Text(
              model.publishedAt!.split('T').first,
              style: getSmallStyle(fontSize: 12, color: AppColors.whiteColor),
            ),
            const Gap(10),
            Text(
              model.author ?? '',
              style: getBodyStyle(fontSize: 14, color: AppColors.dark),
            ),
            const Gap(10),
            Text(
              model.description ?? '',
              style: getBodyStyle(
                  fontSize: 16, color: AppColors.whiteColor.withOpacity(.7)),
            ),
            const Gap(10),
            Text(
              model.source!.name ?? '',
              style: getBodyStyle(fontSize: 14, color: AppColors.redColor),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.dark,
                  foregroundColor: AppColors.dark,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              onPressed: () async {
                await launchUrl(Uri.parse(model.url ?? ''));
              },
              child: const Text(' TO WEBSITE')),
        ),
      ),
    );
  }
}
