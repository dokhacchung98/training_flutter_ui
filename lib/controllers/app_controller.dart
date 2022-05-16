import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:training_flutter_ui/bloc/l10n_cubit.dart';
import 'package:training_flutter_ui/common/color_constant.dart';
import 'package:training_flutter_ui/configs/key_config.dart';
import 'package:training_flutter_ui/generated/l10n.dart';
import 'package:training_flutter_ui/models/movie_favorite_model.dart';
import 'package:training_flutter_ui/repositories/movie_repository.dart';
import 'package:training_flutter_ui/style/style_text.dart';

class AppController extends GetxController {
  RxString sessionId = KeyConfig.sessionId.obs;
  RxString requestToken = KeyConfig.requestToken.obs;
  RxInt userId = KeyConfig.userId.obs;
  RxBool isSendFavorite = false.obs;

  bool isLoadingGetFavorite = false;
  List<MovieFavoriteModel> listMovieFavorite = [];
  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    getListFavorite();
    super.onInit();
    _streamSubscription = BlocProvider.of<L10nCubit>(Get.context!)
        .stream
        .listen((_) => getListFavorite());
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
    super.onClose();
  }

  void showSnackError(String message) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar("Error", message);
    }
  }

  Future addToFavorite(int mediaId, bool favorite) async {
    if (isSendFavorite.value) return;
    MovieRepository _movieRepository = Get.find<MovieRepository>();
    try {
      isSendFavorite.value = true;
      await _movieRepository.addToFavorite(
          userId.value, sessionId.value, "movie", mediaId, favorite);
      showSnackError(favorite
          ? S.of(Get.context!).add_favorite_ss
          : S.of(Get.context!).remove_favorite_ss);
      isSendFavorite.value = false;
      getListFavorite();
    } catch (err) {
      isSendFavorite.value = false;
      showSnackError(favorite
          ? S.of(Get.context!).add_favorite_er
          : S.of(Get.context!).remove_favorite_er);
      print("AppController addToFavorite error ${err}");
    }
  }

  Future getListFavorite() async {
    try {
      if (isLoadingGetFavorite) return;
      MovieRepository _movieRepository = Get.find<MovieRepository>();
      isLoadingGetFavorite = true;
      update();
      Locale? currentLocale = Get.locale;
      List<MovieFavoriteModel> _res =
          await _movieRepository.getListMovieFavorite(
              userId.value,
              sessionId.value,
              currentLocale == null ? 'vi' : currentLocale.languageCode);
      listMovieFavorite = _res;
      isLoadingGetFavorite = false;
      update();
    } catch (err) {
      isLoadingGetFavorite = false;
      update();
      showSnackError(S.of(Get.context!).favorite_fetch_er);
      print("AppController getListFavorite error ${err}");
    }
  }

  showDialog(String message) {
    Get.defaultDialog(
      title: "Alert",
      middleText: message,
      backgroundColor: ColorConstant.colorMain1,
      titleStyle: StyleText.styleTextIMDbLarge,
      middleTextStyle: StyleText.styleDescription,
    );
  }
}
