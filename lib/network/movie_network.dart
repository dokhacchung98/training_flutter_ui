import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:training_flutter_ui/configs/key_config.dart';
import 'package:training_flutter_ui/configs/url_config.dart';
import 'package:training_flutter_ui/models/movie_model.dart';

class MovieNetwork extends GetxService {
  Client? client;

  Future<MovieNetwork> init(Client client) async {
    this.client = client;
    return this;
  }

  Future<List<MovieModel>> getListMoviesTrending() async {
    final response = await client!.get(Uri.parse(
        "${UrlConfig.baseUrlV3}${UrlConfig.getListTrending}?api_key=${KeyConfig.keyMovieV3}"));
    if (response.statusCode != 200) {
      throw "getListMoviesTrending error";
    }
    final listJson = jsonDecode(response.body)["results"] as List;
    List<MovieModel> _result =
        listJson.map((e) => MovieModel.fromJson(e)).toList().sublist(0, 5);
    return _result;
  }

  Future<List<MovieModel>> getListMoviesUpcoming() async {
    final response = await client!.get(Uri.parse(
        "${UrlConfig.baseUrlV3}${UrlConfig.getListUpcoming}?api_key=${KeyConfig.keyMovieV3}"));
    if (response.statusCode != 200) {
      throw "getListMoviesTrending error";
    }
    final listJson = jsonDecode(response.body)["results"] as List;
    List<MovieModel> _result =
        listJson.map((e) => MovieModel.fromJson(e)).toList().sublist(0, 5);
    return _result;
  }
}
