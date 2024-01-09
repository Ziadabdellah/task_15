import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task_15/core/utils/app_colors.dart';
import 'package:task_15/core/utils/styles.dart';
import 'package:task_15/features/news/cubit/news_cubit.dart';
import 'package:task_15/features/news/cubit/news_state.dart';
import 'package:task_15/features/search/widgets/news_search_builder.dart';

class Search_view extends StatefulWidget {
  const Search_view({super.key});

  @override
  State<Search_view> createState() => _Search_viewState();
}

class _Search_viewState extends State<Search_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: getTitleStyle(),
        ),
      ),
      body: BlocBuilder<NewsCubit, News_state>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
                  style: getBodyStyle(),
                  onChanged: (value) {
                    context.read<NewsCubit>().getNewsBysearch(value);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.whiteColor,
                    ),
                    border: InputBorder.none,
                    hintText: 'Search',
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: AppColors.dark,
                    filled: true,
                  ),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        'vdvsdvdsvd',
                        style: getSmallStyle(),
                      ),
                    ],
                  ),
                ),
                Gap(10),
                Expanded(
                  child: state is searchloadingstate
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : state is searchSucessstate
                          ? news_search_builder(
                              modelll: (state as searchSucessstate).Model1,
                            )
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.search_off_rounded,
                                    size: 50,
                                    color: AppColors.whiteColor,
                                  ),
                                  Text(
                                    'No Search data',
                                    style: getBodyStyle(),
                                  ),
                                ],
                              ),
                            ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
