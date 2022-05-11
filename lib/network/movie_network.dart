import 'dart:convert';

import 'package:http/http.dart';
import 'package:training_flutter_ui/configs/key_config.dart';
import 'package:training_flutter_ui/configs/url_config.dart';
import 'package:training_flutter_ui/models/movie_trending_model.dart';

abstract class MovieNetwork {
  final Client client;

  MovieNetwork(this.client);

  Future<List<MovieTrendingModel>> getListMoviesTrending();
}

class MovieNetworkImpl extends MovieNetwork {
  MovieNetworkImpl(Client client) : super(client);

  @override
  Future<List<MovieTrendingModel>> getListMoviesTrending() async {
    Response response = await client.get(Uri.parse(
        "${UrlConfig.baseUrlV3}${UrlConfig.getListTrending}?api_key=${KeyConfig.keyMovieV3}"));
    if (response.statusCode != 200) {
      throw "getListMoviesTrending error";
    }
    final listJson = jsonDecode(response.body)["results"] as List;
    List<MovieTrendingModel> _result =
        listJson.map((e) => MovieTrendingModel.fromJson(e)).toList();
    return _result;
  }
}
