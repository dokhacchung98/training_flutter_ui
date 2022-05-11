import 'package:flutter/material.dart';
import 'package:training_flutter_ui/common/app_image.dart';
import 'package:training_flutter_ui/common/color_constant.dart';
import 'package:training_flutter_ui/style/style_gradient.dart';
import 'package:training_flutter_ui/style/style_text.dart';
import 'package:training_flutter_ui/ui/components/item_generes.dart';
import 'package:training_flutter_ui/ui/components/my_scafflod.dart';
import 'package:training_flutter_ui/ui/screen/main_screen/list_most_popular_widget.dart';
import 'package:training_flutter_ui/ui/screen/main_screen/list_upcoming_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  _onItemTapped(int page) {
    setState(() {
      _selectedIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
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
                      Image.asset(
                        AppImage.iconBell,
                        width: 24,
                        height: 24,
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
                      const Expanded(
                        child: TextField(
                          style: StyleText.styleTextSearch,
                          decoration: InputDecoration(
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
                      Image.asset(
                        AppImage.iconMic,
                        width: 22,
                        height: 22,
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
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: StyleGradient.gradientBackgroundBottomTab,
          border: Border(
              top: BorderSide(width: 1, color: ColorConstant.colorWhite50)),
        ),
        child: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: StyleText.styleDescription,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SizedBox(
                child: Image.asset(
                  AppImage.iconHome,
                  fit: BoxFit.fill,
                  color: _selectedIndex == 0
                      ? ColorConstant.colorWhite100
                      : ColorConstant.colorWhite50,
                ),
                width: 26,
                height: 26,
              ),
              label: _selectedIndex == 0 ? '●' : '',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                child: Image.asset(
                  AppImage.iconHeart,
                  color: _selectedIndex == 1
                      ? ColorConstant.colorWhite100
                      : ColorConstant.colorWhite50,
                ),
                width: 22,
                height: 22,
              ),
              label: _selectedIndex == 1 ? '●' : '',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                child: Image.asset(
                  AppImage.iconTicket,
                  color: _selectedIndex == 2
                      ? ColorConstant.colorWhite100
                      : ColorConstant.colorWhite50,
                ),
                width: 22,
                height: 22,
              ),
              label: _selectedIndex == 2 ? '●' : '',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                child: Image.asset(
                  AppImage.iconAccount,
                  color: _selectedIndex == 3
                      ? ColorConstant.colorWhite100
                      : ColorConstant.colorWhite50,
                ),
                width: 22,
                height: 22,
              ),
              label: _selectedIndex == 3 ? '●' : '',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                child: Image.asset(
                  AppImage.iconShuffle,
                  color: _selectedIndex == 4
                      ? ColorConstant.colorWhite100
                      : ColorConstant.colorWhite50,
                ),
                width: 22,
                height: 22,
              ),
              label: _selectedIndex == 4 ? '●' : '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: ColorConstant.colorWhite100,
          unselectedItemColor: ColorConstant.colorWhite75,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
