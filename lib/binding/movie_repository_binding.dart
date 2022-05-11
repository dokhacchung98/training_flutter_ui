import 'package:get/get.dart';
import 'package:training_flutter_ui/network/base_client.dart';
import 'package:training_flutter_ui/repositories/movie_repository.dart';

class MovieRepositoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => MovieRepositoryImpl(Get.find(tag: (BaseClient).toString())),
        tag: (MovieRepository).toString());
  }
}
