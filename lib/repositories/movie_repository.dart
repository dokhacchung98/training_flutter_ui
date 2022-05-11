import 'package:http/http.dart';
import 'package:training_flutter_ui/models/movie_trending_model.dart';

abstract class MovieRepository {
  final Client client;

  MovieRepository(this.client);

  Future<List<MovieTrendingModel>> getListMoviesTrending();
}

class MovieRepositoryImpl extends MovieRepository {
  MovieRepositoryImpl(Client client) : super(client);

  @override
  Future<List<MovieTrendingModel>> getListMoviesTrending() async {
    throw UnimplementedError();
  }
}
