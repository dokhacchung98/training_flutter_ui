import 'package:training_flutter_ui/models/movie_search_model.dart';

class PagingMovieSearchModel {
  PagingMovieSearchModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  PagingMovieSearchModel.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(MovieSearchModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  int? page;
  List<MovieSearchModel>? results;
  int? totalPages;
  int? totalResults;

  PagingMovieSearchModel copyWith({
    int? page,
    List<MovieSearchModel>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      PagingMovieSearchModel(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] =
          results?.map((v) => (v as MovieSearchModel).toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
