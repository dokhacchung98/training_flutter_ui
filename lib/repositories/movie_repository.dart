import 'package:get/get.dart';
import 'package:training_flutter_ui/models/movie_model.dart';
import 'package:training_flutter_ui/network/movie_network.dart';

class MovieRepository extends GetxService {
  Future<MovieRepository> init() async {
    return this;
  }

  Future<List<MovieModel>> getListMoviesTrending() async {
    MovieNetwork movieNetwork = Get.find<MovieNetwork>();
    return movieNetwork.getListMoviesTrending();
  }

  Future<List<MovieModel>> getListMoviesUpcoming() async {
    MovieNetwork movieNetwork = Get.find<MovieNetwork>();
    return movieNetwork.getListMoviesUpcoming();
  }
}
