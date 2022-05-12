import 'package:training_flutter_ui/models/movie_model.dart';
import 'package:training_flutter_ui/network/movie_network.dart';

abstract class MovieRepository {
  final MovieNetwork movieNetwork;

  MovieRepository(this.movieNetwork);

  Future<List<MovieModel>> getListMoviesTrending();

  Future<List<MovieModel>> getListMoviesUpcoming();
}

class MovieRepositoryImpl extends MovieRepository {
  MovieRepositoryImpl(MovieNetwork movieNetwork) : super(movieNetwork);

  @override
  Future<List<MovieModel>> getListMoviesTrending() async {
    return movieNetwork.getListMoviesTrending();
  }

  @override
  Future<List<MovieModel>> getListMoviesUpcoming() async {
    return movieNetwork.getListMoviesUpcoming();
  }
}
