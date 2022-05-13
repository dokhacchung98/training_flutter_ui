import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:training_flutter_ui/controllers/app_controller.dart';
import 'package:training_flutter_ui/models/movie_detail_model.dart';
import 'package:training_flutter_ui/repositories/movie_repository.dart';

class DetailController extends GetxController {
  Rx<MovieDetailModel?> movieDetailModel = Rx(null);
  RxBool isLoading = false.obs;
  RxString firstName = "Loading".obs;
  RxString lastName = "".obs;
  RxList listType = [].obs;
  RxString description = "".obs;
  RxDouble score = 5.0.obs;
  String fullDes = "";
  RxBool isShowMore = false.obs;
  RxBool isFavorite = false.obs;
  RxDouble valueOfPaddingTop = (Get.height * 0.4).obs;
  bool _isUp = true;

  final AppController _appController = Get.find<AppController>();

  @override
  void onInit() {
    super.onInit();
    if (Get.parameters["id"] != null) {
      getDetailMovie(int.parse(Get.parameters["id"].toString()));
    } else {
      Get.snackbar("Error", "Please try again!");
      Get.back();
    }
  }

  Future getDetailMovie(int id) async {
    try {
      MovieRepository _movieRepository = Get.find<MovieRepository>();
      isLoading.value = true;
      final res = await _movieRepository.getDetailMovie(id);
      movieDetailModel.value = res;
      String name = movieDetailModel.value!.title!;
      List<String> names = name.split(" ");
      firstName.value = names[0];
      names.removeAt(0);
      lastName.value = names.join(" ");
      listType.addAll(res.genres ?? []);
      score.value = res.voteAverage ?? 5.0;
      fullDes = res.overview ?? '';
      if (fullDes.length > 160) {
        isShowMore.value = true;
        description.value = fullDes.substring(0, 160) + "... ";
      } else {
        isShowMore.value = false;
        description.value = fullDes;
      }

      isFavorite.value = _appController.listMovieFavorite
          .any((element) => element.id! == res.id!);

      isLoading.value = false;
    } catch (err) {
      Get.snackbar("Error", "get detail video error, please try again!");
      Get.back();
      print('DetailController getDetailMovie error $err');
      isLoading.value = false;
    }
  }

  Future addOrRemoveToFavorite() async {
    final AppController _appController = Get.find<AppController>();
    await _appController.addToFavorite(
        movieDetailModel.value!.id!, !isFavorite.value);
    isFavorite.value = !isFavorite.value;
  }

  showMoreDes() {
    isShowMore.value = false;
    description.value = fullDes;
  }

  _changeSizeBottomView(bool isFull) {
    double _height = isFull ? 0 : (Get.height * 0.4);
    valueOfPaddingTop.value = _height;
  }

  handlePan(DragUpdateDetails details) {
    valueOfPaddingTop.value = min(
        max(0, valueOfPaddingTop.value + details.delta.dy), Get.height * 0.4);
    _isUp = details.delta.dy < 0;
  }

  handlePanEnd() {
    _changeSizeBottomView(_isUp);
  }
}
