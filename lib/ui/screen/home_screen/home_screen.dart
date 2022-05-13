import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_flutter_ui/common/app_image.dart';
import 'package:training_flutter_ui/common/color_constant.dart';
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
    return Stack(
      children: [
        SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
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
                  margin: const EdgeInsets.only(top: 10, right: 50, left: 50),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    border: Border.all(
                      width: 1,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Image.asset(
                          AppImage.iconSearch,
                          width: 22,
                          height: 22,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          textInputAction: TextInputAction.search,
                          onSubmitted: _onSearch,
                          style: StyleText.styleTextSearch,
                          decoration: const InputDecoration(
                              hoverColor: ColorConstant.colorWhite50,
                              border: InputBorder.none,
                              hintText: 'Search',
                              hintStyle: StyleText.styleTextSearchHint),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.white.withOpacity(0.5),
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      GestureDetector(
                        onTap: () => _showDialog("speech to text"),
                        child: Image.asset(
                          AppImage.iconMic,
                          width: 22,
                          height: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 50, right: 50, top: 16, bottom: 12),
                  child:
                      Text('Most popular', style: StyleText.styleTextTitleHome),
                ),
                const ListMostPopularWidget(),
                const SizedBox(height: 12),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
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
                      EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 12),
                  child: Text('Upcoming releases',
                      style: StyleText.styleTextTitleHome),
                ),
                const ListUpcomingWidget(),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
        IgnorePointer(
          ignoring: true,
          child: Container(
            width: 40,
            // height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: StyleGradient.gradientBackgroundShadowLeft),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IgnorePointer(
            ignoring: true,
            child: Container(
              width: 40,
              // height: 210,
              decoration: const BoxDecoration(
                  gradient: StyleGradient.gradientBackgroundShadowRight),
            ),
          ),
        )
      ],
    );
  }
}
