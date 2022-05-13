import 'package:get/get.dart';
import 'package:training_flutter_ui/models/movie_detail_model.dart';
import 'package:training_flutter_ui/models/movie_favorite_model.dart';
import 'package:training_flutter_ui/models/movie_model.dart';
import 'package:training_flutter_ui/models/paging_movie_search_model.dart';
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

  Future<MovieDetailModel> getDetailMovie(int id) async {
    MovieNetwork movieNetwork = Get.find<MovieNetwork>();
    return movieNetwork.getDetailMovie(id);
  }

  Future addToFavorite(int accountId, String sessionId, String mediaType,
      int mediaId, bool favorite) async {
    MovieNetwork movieNetwork = Get.find<MovieNetwork>();
    return movieNetwork.addToFavorite(
        accountId, sessionId, mediaType, mediaId, favorite);
  }

  Future<List<MovieFavoriteModel>> getListMovieFavorite(
      int accountId, String sessionId) async {
    MovieNetwork movieNetwork = Get.find<MovieNetwork>();
    return movieNetwork.getListMovieFavorite(accountId, sessionId);
  }

  Future<PagingMovieSearchModel> searchMovie(String keyword, int page) async {
    MovieNetwork movieNetwork = Get.find<MovieNetwork>();
    return movieNetwork.searchMovie(keyword, page);
  }
}
