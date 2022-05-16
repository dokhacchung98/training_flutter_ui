import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_flutter_ui/common/app_image.dart';
import 'package:training_flutter_ui/common/color_constant.dart';
import 'package:training_flutter_ui/controllers/app_controller.dart';
import 'package:training_flutter_ui/controllers/home_controller.dart';
import 'package:training_flutter_ui/generated/l10n.dart';
import 'package:training_flutter_ui/style/style_gradient.dart';
import 'package:training_flutter_ui/style/style_text.dart';
import 'package:training_flutter_ui/ui/components/item_generes.dart';
import 'package:training_flutter_ui/ui/screen/home_screen/list_most_popular_widget.dart';
import 'package:training_flutter_ui/ui/screen/home_screen/list_upcoming_widget.dart';

class HomeScreen extends GetWidget<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController _homeController =
      Get.put<HomeController>(HomeController());

  _showDialog(String mes) {
    AppController _appController = Get.find<AppController>();
    _appController.showDialog(mes);
  }

  _onSearch(String value) {
    HomeController _homeController = Get.find<HomeController>();
    _homeController.goToSearchMovieScreen(value.trim());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 42),
                  child: Row(
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: '  ${S.of(context).home_hello}, ',
                            style: StyleText.styleTextHello,
                            children: const [
                              TextSpan(
                                  text: 'Jane!',
                                  style: StyleText.styleTextUserName)
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _showDialog("Notification"),
                        child: Image.asset(
                          AppImage.iconBell,
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, right: 44, left: 42),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                  height: 42,
                  decoration: BoxDecoration(
                    gradient: StyleGradient.gradientInput,
                    border: Border.all(
                      width: 1,
                      color: Colors.white24,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Icon(
                          Icons.search,
                          size: 24,
                          color: ColorConstant.colorWhite50,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 42,
                          child: TextField(
                            textInputAction: TextInputAction.search,
                            onSubmitted: _onSearch,
                            style: StyleText.styleTextSearch,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: S.of(context).home_search,
                                hintStyle: StyleText.styleTextSearchHint),
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.white24,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                      ),
                      GestureDetector(
                        onTap: () => _showDialog("speech to text"),
                        child: Image.asset(
                          AppImage.iconMic,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 42, right: 42, top: 16, bottom: 12),
                  child: Text(S.of(context).home_popular,
                      style: StyleText.styleTextTitleHome),
                ),
                const ListMostPopularWidget(),
                const SizedBox(height: 12),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 42, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemGeneres(
                          icon: AppImage.imgGeneres,
                          title: S.of(context).home_genres),
                      ItemGeneres(
                          icon: AppImage.imgTV, title: S.of(context).home_tv),
                      ItemGeneres(
                          icon: AppImage.imgMovie,
                          title: S.of(context).home_movies),
                      ItemGeneres(
                          icon: AppImage.imgTheatre,
                          title: S.of(context).home_theatre),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 42, right: 42, top: 20, bottom: 12),
                  child: Text(S.of(context).home_release,
                      style: StyleText.styleTextTitleHome),
                ),
                const ListUpcomingWidget(),
                const SizedBox(height: 12),
              ],
            ),
          )),
    );
  }
}
