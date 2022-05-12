import 'package:get/get.dart';
import 'package:training_flutter_ui/network/movie_network.dart';
import 'package:training_flutter_ui/repositories/movie_repository.dart';

class RepositoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieRepositoryImpl(Get.find<MovieNetworkImpl>()));
  }
}
