import 'package:flutter/material.dart';
import 'package:task_15/core/utils/app_colors.dart';
import 'package:task_15/core/utils/styles.dart';

class Grid_source extends StatelessWidget {
  const Grid_source({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: AppColors.dark, borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadiusDirectional.circular(20),
        child: Column(
          children: [
            Image.asset(
              'assets/asd.jpg',
              height: 110,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'News',
                    style: getBodyStyle(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
