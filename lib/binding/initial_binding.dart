import 'package:get/get.dart';
import 'package:training_flutter_ui/binding/client_binding.dart';
import 'package:training_flutter_ui/binding/movie_repository_binding.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    ClientBinding().dependencies();
    MovieRepositoryBinding().dependencies();
  }
}
