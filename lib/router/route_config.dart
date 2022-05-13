import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:training_flutter_ui/router/route_source.dart';
import 'package:training_flutter_ui/ui/screen/detail_screen/detail_screen.dart';
import 'package:training_flutter_ui/ui/screen/list_movie_search/list_movie_search.dart';
import 'package:training_flutter_ui/ui/screen/splash_screen/splash_screen.dart';

class RouteConfig {
  static final List<GetPage> getPages = [
    GetPage(name: RouterSource.splash, page: () => const SplashScreen()),
    GetPage(name: RouterSource.detailScreen, page: () => DetailScreen()),
    GetPage(name: RouterSource.searchScreen, page: () => ListMovieSearch()),
  ];
}
