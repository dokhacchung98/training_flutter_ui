class MovieFavoriteModel {
  MovieFavoriteModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.voteCount,
    this.video,
    this.voteAverage,
    this.title,
    this.overview,
    this.releaseDate,
    this.id,
    this.popularity,
  });

  MovieFavoriteModel.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    voteCount = json['vote_count'];
    video = json['video'];
    voteAverage = double.parse(json['vote_average'].toString());
    title = json['title'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    id = json['id'];
    popularity = double.parse(json['popularity'].toString());
  }

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  String? originalLanguage;
  String? originalTitle;
  String? posterPath;
  int? voteCount;
  bool? video;
  double? voteAverage;
  String? title;
  String? overview;
  String? releaseDate;
  int? id;
  double? popularity;

  MovieFavoriteModel copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    String? originalLanguage,
    String? originalTitle,
    String? posterPath,
    int? voteCount,
    bool? video,
    double? voteAverage,
    String? title,
    String? overview,
    String? releaseDate,
    int? id,
    double? popularity,
  }) =>
      MovieFavoriteModel(
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        genreIds: genreIds ?? this.genreIds,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        posterPath: posterPath ?? this.posterPath,
        voteCount: voteCount ?? this.voteCount,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        title: title ?? this.title,
        overview: overview ?? this.overview,
        releaseDate: releaseDate ?? this.releaseDate,
        id: id ?? this.id,
        popularity: popularity ?? this.popularity,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['poster_path'] = posterPath;
    map['vote_count'] = voteCount;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['title'] = title;
    map['overview'] = overview;
    map['release_date'] = releaseDate;
    map['id'] = id;
    map['popularity'] = popularity;
    return map;
  }
}
