import 'package:get/get.dart';

import 'screen/main_screen_binding.dart';

class ScreenBinding extends Bindings {
  @override
  void dependencies() {
    MainScreenBinding().dependencies();
  }
}
