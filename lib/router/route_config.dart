import 'package:flutter/material.dart';
import 'package:training_flutter_ui/ui/components/my_scafflod.dart';
import 'package:training_flutter_ui/ui/screen/detail_screen/detail_screen.dart';
import 'package:training_flutter_ui/ui/screen/main_screen/main_screen.dart';
import 'package:training_flutter_ui/ui/screen/splash_screen/splash_screen.dart';

class RouteConfig {
  static const String splash = "/splash-screen";
  static const String detailScreen = "/detail-screen";
  static const String main = "/";

  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case detailScreen:
        return MaterialPageRoute(builder: (_) => const DetailScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const MyScaffold(
            body: Center(
              child: Text('Router empty'),
            ),
          ),
        );
    }
  }
}
