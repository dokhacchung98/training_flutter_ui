import 'package:get/get.dart';
import 'package:training_flutter_ui/models/movie_model.dart';
import 'package:training_flutter_ui/repositories/movie_repository.dart';

class HomeController extends GetxController {
  RxList listMovieTrending = [].obs;
  RxBool isLoadingSlide = false.obs;

  List<MovieModel> listMovieUpcoming = [];
  bool isLoadingUpcoming = false;

  @override
  void onInit() {
    getListMovieTrending();
    getListMovieUpcoming();
    super.onInit();
  }

  Future getListMovieTrending() async {
    try {
      MovieRepository _movieRepository =
          Get.find<MovieRepositoryImpl>(tag: (MovieRepositoryImpl).toString());
      isLoadingSlide.value = true;
      final res = await _movieRepository.getListMoviesTrending();
      listMovieTrending.addAll(res);
      isLoadingSlide.value = false;
    } catch (err) {
      print('HomeController getListMovieTrending error $err');
      isLoadingSlide.value = false;
    }
  }

  Future getListMovieUpcoming() async {
    try {
      MovieRepository _movieRepository =
          Get.find<MovieRepositoryImpl>(tag: (MovieRepositoryImpl).toString());
      isLoadingUpcoming = true;
      update();
      final res = await _movieRepository.getListMoviesTrending();
      print("IUUUUU ${res.length}");
      listMovieUpcoming = res;
      isLoadingUpcoming = false;
      update();
    } catch (err) {
      print('HomeController getListMovieUpcoming error $err');
      isLoadingUpcoming = false;
      update();
    }
  }
}
