import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_flutter_ui/common/app_image.dart';
import 'package:training_flutter_ui/controllers/app_controller.dart';
import 'package:training_flutter_ui/controllers/home_controller.dart';
import 'package:training_flutter_ui/style/style_gradient.dart';
import 'package:training_flutter_ui/style/style_text.dart';
import 'package:training_flutter_ui/ui/components/item_generes.dart';
import 'package:training_flutter_ui/ui/screen/home_screen/list_most_popular_widget.dart';
import 'package:training_flutter_ui/ui/screen/home_screen/list_upcoming_widget.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

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
                          text: const TextSpan(
                            text: '  Hello, ',
                            style: StyleText.styleTextHello,
                            children: [
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
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Image.asset(
                          AppImage.iconSearch,
                          width: 20,
                          height: 20,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 42,
                          child: TextField(
                            textInputAction: TextInputAction.search,
                            onSubmitted: _onSearch,
                            style: StyleText.styleTextSearch,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
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
                const Padding(
                  padding:
                      EdgeInsets.only(left: 42, right: 42, top: 16, bottom: 12),
                  child:
                      Text('Most popular', style: StyleText.styleTextTitleHome),
                ),
                const ListMostPopularWidget(),
                const SizedBox(height: 12),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 42, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemGeneres(icon: AppImage.imgGeneres, title: "Genres"),
                      ItemGeneres(icon: AppImage.imgTV, title: "TV Series"),
                      ItemGeneres(icon: AppImage.imgMovie, title: "Movies"),
                      ItemGeneres(
                          icon: AppImage.imgTheatre, title: "In Theatre"),
                    ],
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 42, right: 42, top: 20, bottom: 12),
                  child: Text('Upcoming releases',
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
