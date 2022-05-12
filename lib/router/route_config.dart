import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:training_flutter_ui/router/route_source.dart';
import 'package:training_flutter_ui/ui/screen/detail_screen/detail_screen.dart';
import 'package:training_flutter_ui/ui/screen/splash_screen/splash_screen.dart';

class RouteConfig {
  // static Route<dynamic> generateRoute(RouteSettings setting) {
  //   switch (setting.name) {
  //     case splash:
  //       return MaterialPageRoute(builder: (_) => const SplashScreen());
  //     case main:
  //       return MaterialPageRoute(builder: (_) => const MainScreen());
  //     case detailScreen:
  //       return MaterialPageRoute(builder: (_) => const DetailScreen());
  //     default:
  //       return MaterialPageRoute(
  //         builder: (_) => const MyScaffold(
  //           body: Center(
  //             child: Text('Router empty'),
  //           ),
  //         ),
  //       );
  //   }
  // }
  static final List<GetPage> getPages = [
    GetPage(name: RouterSource.splash, page: () => const SplashScreen()),
    GetPage(name: RouterSource.detailScreen, page: () => const DetailScreen()),
  ];
}
