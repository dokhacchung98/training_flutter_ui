import 'package:get/get.dart';
import 'package:training_flutter_ui/binding/screen/home_binding.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    HomeBinding().dependencies();
  }
}
