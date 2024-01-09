import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_15/core/utils/app_colors.dart';
import 'package:task_15/core/utils/styles.dart';
import 'package:task_15/features/news/news_details_view.dart';
import 'package:task_15/model1/model1.dart';

class news_search_builder extends StatelessWidget {
  const news_search_builder({super.key, required this.modelll});

  final Model1 modelll;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: modelll.totalResults,
      itemBuilder: (context, index) {
        var item = modelll.articles![index];

        return GestureDetector(
          onTap: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => news_details_vi(model: item),
            ));
          },
          child: Container(
            height: 120,
            margin: EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: AppColors.dark,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: (item.urlToImage == null)
                      ? Image.asset('assets/asd.jpg')
                      : Image.network(
                          item.urlToImage!,
                          height: 120,
                          width: 160,
                          fit: BoxFit.cover,
                        ),
                ),
                Gap(10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: getBodyStyle(
                            fontSize: 12,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Text(
                          item.author ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: getBodyStyle(
                            fontSize: 12,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.read_more),
                            const Gap(5),
                            Text(
                              'Read',
                              style: getSmallStyle(
                                fontSize: 10,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              // Format the date using DateTime
                              item.publishedAt != null
                                  ? DateTime.parse(item.publishedAt!)
                                      .toLocal()
                                      .toString()
                                      .split(' ')[0]
                                  : '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: getBodyStyle(
                                fontSize: 12,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
