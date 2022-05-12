import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_flutter_ui/binding/initial_binding.dart';
import 'package:training_flutter_ui/controllers/home_controller.dart';
import 'package:training_flutter_ui/router/route_config.dart';
import 'package:training_flutter_ui/router/route_source.dart';
import 'package:training_flutter_ui/ui/screen/main_screen/main_screen.dart';

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
  HomeController vm = Get.put<HomeController>(HomeController());
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
      initialBinding: InitialBinding(),
      home: MainScreen(),
    );
  }
}
