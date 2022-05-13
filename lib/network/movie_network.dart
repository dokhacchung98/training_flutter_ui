import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:training_flutter_ui/configs/key_config.dart';
import 'package:training_flutter_ui/configs/url_config.dart';
import 'package:training_flutter_ui/models/movie_detail_model.dart';
import 'package:training_flutter_ui/models/movie_favorite_model.dart';
import 'package:training_flutter_ui/models/movie_model.dart';
import 'package:training_flutter_ui/models/paging_movie_search_model.dart';

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
      throw "getListMoviesUpcoming error";
    }
    final listJson = jsonDecode(response.body)["results"] as List;
    List<MovieModel> _result =
        listJson.map((e) => MovieModel.fromJson(e)).toList().sublist(0, 5);
    return _result;
  }

  Future<MovieDetailModel> getDetailMovie(int id) async {
    final response = await client!.get(Uri.parse(
        "${UrlConfig.baseUrlV3}${UrlConfig.getDetailMovie}$id?api_key=${KeyConfig.keyMovieV3}"));
    if (response.statusCode != 200) {
      throw "getDetailMovie error";
    }
    final json = jsonDecode(response.body);
    MovieDetailModel _result = MovieDetailModel.fromJson(json);
    return _result;
  }

  Future<void> addToFavorite(int accountId, String sessionId, String mediaType,
      int mediaId, bool favorite) async {
    Map<String, dynamic> data = {
      'media_type': mediaType,
      'media_id': '$mediaId',
      'favorite': favorite
    };
    final _url =
        "${UrlConfig.baseUrlV3}/account/$accountId/favorite?api_key=${KeyConfig.keyMovieV3}&session_id=$sessionId";
    final response = await client!.post(Uri.parse(_url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw "getDetailMovie error";
    }
  }

  Future<List<MovieFavoriteModel>> getListMovieFavorite(
      int accountId, String sessionId) async {
    final response = await client!.get(Uri.parse(
        "${UrlConfig.baseUrlV3}/account/$accountId}/favorite/movies?api_key=${KeyConfig.keyMovieV3}&session_id=$sessionId"));
    if (response.statusCode != 200) {
      throw "getDetailMovie error";
    }
    final listJson = jsonDecode(response.body)["results"] as List;
    List<MovieFavoriteModel> _result =
        listJson.map((e) => MovieFavoriteModel.fromJson(e)).toList();
    return _result;
  }

  Future<PagingMovieSearchModel> searchMovie(String keyword, int page) async {
    final response = await client!.get(Uri.parse(
        "${UrlConfig.baseUrlV3}${UrlConfig.searchMovie}?api_key=${KeyConfig.keyMovieV3}&page=$page&query=$keyword"));
    if (response.statusCode != 200) {
      throw "getDetailMovie error";
    }
    final json = jsonDecode(response.body);
    PagingMovieSearchModel _result = PagingMovieSearchModel.fromJson(json);
    return _result;
  }
}
