import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task_15/core/utils/app_colors.dart';
import 'package:task_15/core/utils/styles.dart';
import 'package:task_15/features/news/cubit/news_cubit.dart';
import 'package:task_15/features/news/cubit/news_state.dart';
import 'package:task_15/features/news/news_details_view.dart';

class news_list_buli extends StatefulWidget {
  const news_list_buli(
    this.category, {
    super.key,
  });
  final String category;

  @override
  State<news_list_buli> createState() => _NewsListBuilderState();
}

class _NewsListBuilderState extends State<news_list_buli> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>()..getNewsByCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, News_state>(builder: (context, state) {
      if (state is Newsloadingstate) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is NewSucessstate) {
        var news = state.Model1;

        return ListView.builder(
          itemCount: news.totalResults,
          itemBuilder: (context, index) {
            var item = news.articles![index];
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
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: (item.urlToImage == null)
                          ? Image.asset('assets/asd.jpg')
                          : Image.network(
                              item.urlToImage,
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
                                fontSize: 12, color: AppColors.whiteColor),
                          ),
                          Text(
                            item.author ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: getBodyStyle(
                                fontSize: 12, color: AppColors.whiteColor),
                          ),
                          Row(
                            children: [
                              Icon(Icons.read_more),
                              const Gap(5),
                              Text(
                                'Read',
                                style: getSmallStyle(
                                    fontSize: 10, color: AppColors.whiteColor),
                              ),
                              const Spacer(),
                              Text(
                                item.publishedAt!.split('T')[0] ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: getBodyStyle(
                                    fontSize: 12, color: AppColors.whiteColor),
                              ),
                            ],
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            );
          },
        );
      } else {
        return const Text('Errrorrr');
      }
    });
  }
}
















