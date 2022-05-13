import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_flutter_ui/controllers/app_controller.dart';
import 'package:training_flutter_ui/controllers/home_controller.dart';
import 'package:training_flutter_ui/network/base_client.dart';
import 'package:training_flutter_ui/network/movie_network.dart';
import 'package:training_flutter_ui/repositories/movie_repository.dart';
import 'package:training_flutter_ui/router/route_config.dart';
import 'package:training_flutter_ui/router/route_source.dart';
import 'package:training_flutter_ui/ui/screen/main_screen/main_screen.dart';

void main() async {
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => MyApp(), // Wrap your app
  //   ),
  // );
  await Get.putAsync(() => MovieNetwork().init(BaseClient.instance.client!));
  await Get.putAsync(() => MovieRepository().init());
  Get.put<AppController>(AppController());
  Get.put<HomeController>(HomeController());
  // Get.put(DetailController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie Application',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouterSource.main,
      getPages: RouteConfig.getPages,
      home: MainScreen(),
    );
  }
}
