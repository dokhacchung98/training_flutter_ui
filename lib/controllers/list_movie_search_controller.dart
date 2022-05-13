import 'package:get/get.dart';
import 'package:training_flutter_ui/models/movie_search_model.dart';
import 'package:training_flutter_ui/models/paging_movie_search_model.dart';
import 'package:training_flutter_ui/repositories/movie_repository.dart';

class ListMovieSearchController extends GetxController {
  String keyword = "";
  List<MovieSearchModel> listMovies = [];
  int currentPage = 1;
  int totalPage = 1;
  int totalElement = 0;
  bool isError = false;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments.isNotEmpty) {
      keyword = Get.arguments;
      update();
      searchMovie();
    }
  }

  Future searchMovie() async {
    try {
      if (isError || isLoading) return;
      isLoading = true;
      update();
      MovieRepository _movieRepository = Get.find<MovieRepository>();
      PagingMovieSearchModel _pagingMovieSearchModel =
          await _movieRepository.searchMovie(keyword, currentPage);
      listMovies.addAll(_pagingMovieSearchModel.results ?? []);
      currentPage = _pagingMovieSearchModel.page ?? 1;
      totalPage = _pagingMovieSearchModel.totalPages ?? 1;
      totalElement = _pagingMovieSearchModel.totalResults ?? 0;
      isError = false;
      isLoading = false;
      update();
    } catch (err) {
      isError = true;
      isLoading = false;
      Get.snackbar("Error", "search video error, please try again!");
      update();
      print('DetailController getDetailMovie error $err');
    }
  }

  pullToRefresh() {
    listMovies = [];
    currentPage = 1;
    totalPage = 1;
    totalElement = 0;
    update();
    searchMovie();
  }

  goToNextPage() {
    if (currentPage >= totalPage) return;
    currentPage++;
    searchMovie();
  }
}
