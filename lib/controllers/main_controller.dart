import 'package:get/get.dart';
import 'package:training_flutter_ui/repositories/movie_repository.dart';

class MainController extends GetxController {
  RxList listMovieTrending = [].obs;
  RxList listMovieUpcoming = [].obs;

  Future getListMovieTrending() async {
    MovieRepository _movieRepository =
        Get.find(tag: (MovieRepository).toString());
    final res = await _movieRepository.getListMoviesTrending();
    listMovieTrending.addAll(res);
  }
}
