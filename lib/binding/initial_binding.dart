import 'package:get/get.dart';
import 'package:training_flutter_ui/binding/client_binding.dart';
import 'package:training_flutter_ui/binding/repository_binding.dart';
import 'package:training_flutter_ui/binding/screen_binding.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    ClientBinding().dependencies();
    RepositoryBinding().dependencies();
    ScreenBinding().dependencies();
  }
}
