import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:training_flutter_ui/network/base_client.dart';
import 'package:training_flutter_ui/repositories/movie_repository.dart';
import 'package:training_flutter_ui/router/route_config.dart';

void main() {
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => MyApp(), // Wrap your app
  //   ),
  // );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  BaseClient? _baseClient;
  MovieRepository? _movieRepository;

  MyApp({Key? key}) : super(key: key) {
    _baseClient = BaseClient.instance;
    _movieRepository = MovieRepositoryImpl(_baseClient!.client!);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Application',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouteConfig.generateRoute,
      initialRoute: RouteConfig.main,
      // initialBinding: InitialBinding(),
    );
  }
}
