class UrlConfig {
  static const String baseUrlV3 = "https://api.themoviedb.org/3";
  static const String baseUrlV4 = "https://api.themoviedb.org/4";

  static const String getListTrending = "/movie/popular";
  static const String getListUpcoming = "/movie/upcoming";
  static const String getListWeekSuggest = "/trending/movie/week";

  static String baseUrlImg(String path, {int width = 500}) {
    return "https://image.tmdb.org/t/p/w$width$path";
  }
}
