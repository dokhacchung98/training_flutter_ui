class UrlConfig {
  static const String baseUrlV3 = "https://api.themoviedb.org/3";
  static const String baseUrlV4 = "https://api.themoviedb.org/4";

  static const String getListTrending = "/trending/movie/week";

  static String baseUrlImg({double width = 500}) {
    return "https://image.tmdb.org/t/p/w$width";
  }
}
