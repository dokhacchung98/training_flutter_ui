class MovieTrendingModel {
  MovieTrendingModel({
    this.backdropPath,
    this.title,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.video,
    this.voteAverage,
    this.overview,
    this.releaseDate,
    this.voteCount,
    this.id,
    this.adult,
    this.popularity,
    this.mediaType,
  });

  MovieTrendingModel.fromJson(dynamic json) {
    backdropPath = json['backdrop_path'];
    title = json['title'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    video = json['video'];
    voteAverage = json['vote_average'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    voteCount = json['vote_count'];
    id = json['id'];
    adult = json['adult'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
  }
  String? backdropPath;
  String? title;
  List<int>? genreIds;
  String? originalLanguage;
  String? originalTitle;
  String? posterPath;
  bool? video;
  double? voteAverage;
  String? overview;
  String? releaseDate;
  int? voteCount;
  int? id;
  bool? adult;
  double? popularity;
  String? mediaType;
  MovieTrendingModel copyWith({
    String? backdropPath,
    String? title,
    List<int>? genreIds,
    String? originalLanguage,
    String? originalTitle,
    String? posterPath,
    bool? video,
    double? voteAverage,
    String? overview,
    String? releaseDate,
    int? voteCount,
    int? id,
    bool? adult,
    double? popularity,
    String? mediaType,
  }) =>
      MovieTrendingModel(
        backdropPath: backdropPath ?? this.backdropPath,
        title: title ?? this.title,
        genreIds: genreIds ?? this.genreIds,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        posterPath: posterPath ?? this.posterPath,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        overview: overview ?? this.overview,
        releaseDate: releaseDate ?? this.releaseDate,
        voteCount: voteCount ?? this.voteCount,
        id: id ?? this.id,
        adult: adult ?? this.adult,
        popularity: popularity ?? this.popularity,
        mediaType: mediaType ?? this.mediaType,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = backdropPath;
    map['title'] = title;
    map['genre_ids'] = genreIds;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['poster_path'] = posterPath;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['overview'] = overview;
    map['release_date'] = releaseDate;
    map['vote_count'] = voteCount;
    map['id'] = id;
    map['adult'] = adult;
    map['popularity'] = popularity;
    map['media_type'] = mediaType;
    return map;
  }
}
