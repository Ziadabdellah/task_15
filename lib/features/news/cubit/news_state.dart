
class News_state {}

class NewsInitstate extends News_state {}

class Newsloadingstate extends News_state {}

class NewSucessstate extends News_state {
  final Model1 ;

  NewSucessstate({required this.Model1});
}

class NewsErrorstate extends News_state {
  final String error;

  NewsErrorstate({required this.error});
}






class searchInitstate extends News_state {}

class searchloadingstate extends News_state {}

class searchSucessstate extends News_state {
  final Model1 ;

  searchSucessstate({required this.Model1});
}

class searchErrorstate extends News_state {
  final String error;

  searchErrorstate({required this.error});
}


