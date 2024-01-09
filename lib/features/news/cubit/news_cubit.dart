import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_15/core/services/api_services.dart';
import 'package:task_15/features/news/cubit/news_state.dart';

class NewsCubit extends Cubit<News_state> {
  NewsCubit() : super(NewsInitstate());

  getNewsByCategory(String category) {
    emit(Newsloadingstate());
    try {
      Api_serve().getNewsByCategory(category).then((value) {
        emit(NewSucessstate(Model1: value!));
      });
    } catch (e) {
      emit(NewsErrorstate(error: e.toString()));
    }
  }




getNewsBysearch(String search) {
    emit(searchloadingstate());
    try {
      Api_serve().getNewsByCategory(search).then((value) {
        emit(searchSucessstate(Model1: value!));
      });
    } catch (e) {
      emit(searchErrorstate(error: e.toString()));
    }
  }

}
