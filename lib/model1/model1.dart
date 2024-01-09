import 'article.dart';

class Model1 {
  String? status;
  int? totalResults;
  List<Article>? articles;

  Model1({this.status, this.totalResults, this.articles});

  factory Model1.fromJson(Map<String, dynamic> json) => Model1(
        status: json['status'] as String?,
        totalResults: json['totalResults'] as int?,
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'articles': articles?.map((e) => e.toJson()).toList(),
      };
}
