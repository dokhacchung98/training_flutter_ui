import 'package:get/get.dart';
import 'package:training_flutter_ui/common/color_constant.dart';
import 'package:training_flutter_ui/configs/key_config.dart';
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

  @override
  void onInit() {
    getListFavorite();
    super.onInit();
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
      Get.snackbar(
          "Success", "${favorite ? 'add' : 'remove'} to favorite successful");
      isSendFavorite.value = false;
      getListFavorite();
    } catch (err) {
      isSendFavorite.value = false;
      showSnackError(
          "${favorite ? 'add' : 'remove'} to favorite error, please try again!");
      print("AppController addToFavorite error ${err}");
    }
  }

  Future getListFavorite() async {
    try {
      if (isLoadingGetFavorite) return;
      MovieRepository _movieRepository = Get.find<MovieRepository>();
      isLoadingGetFavorite = true;
      update();
      List<MovieFavoriteModel> _res = await _movieRepository
          .getListMovieFavorite(userId.value, sessionId.value);
      listMovieFavorite = _res;
      isLoadingGetFavorite = false;
      update();
    } catch (err) {
      isLoadingGetFavorite = false;
      update();
      showSnackError("Get list movie favorite error, please try again!");
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
