import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_15/core/utils/app_colors.dart';
import 'package:task_15/core/utils/styles.dart';
import 'package:task_15/features/search/widgets/news_search_builder.dart';
import 'package:task_15/features/source/widgets/grid_source_item.dart';

class source_view extends StatefulWidget {
  const source_view({super.key});

  @override
  State<source_view> createState() => _source_viewState();
}

class _source_viewState extends State<source_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'source_view',
          style: getTitleStyle(),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: GridView.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            children: [
              Grid_source(),
              Grid_source(),
              Grid_source(),
              Grid_source(),
              Grid_source(),
              Grid_source(),
              Grid_source(),
              Grid_source(),
            ],
          )),
    );
  }
}
