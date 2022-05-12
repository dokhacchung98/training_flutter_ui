import 'package:flutter/material.dart';
import 'package:training_flutter_ui/common/app_image.dart';
import 'package:training_flutter_ui/common/color_constant.dart';
import 'package:training_flutter_ui/style/style_gradient.dart';
import 'package:training_flutter_ui/style/style_text.dart';
import 'package:training_flutter_ui/ui/components/my_scafflod.dart';
import 'package:training_flutter_ui/ui/screen/account_screen/acount_screen.dart';
import 'package:training_flutter_ui/ui/screen/favorite_screen/favorite_screen.dart';
import 'package:training_flutter_ui/ui/screen/home_screen/home_screen.dart';
import 'package:training_flutter_ui/ui/screen/shuffle_screen/shuffle_screen.dart';
import 'package:training_flutter_ui/ui/screen/ticket_screen/ticket_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final HomeScreen _homeScreen = HomeScreen();
  final FavoriteScreen _favoriteScreen = const FavoriteScreen();
  final TicketScreen _ticketScreen = const TicketScreen();
  final AccountScreen _accountScreen = const AccountScreen();
  final ShuffleScreen _shuffleScreen = const ShuffleScreen();
  _onItemTapped(int page) {
    setState(() {
      _selectedIndex = page;
    });
  }

  Widget _getPageView() {
    switch (_selectedIndex) {
      case 0:
        return _homeScreen;
      case 1:
        return _favoriteScreen;
      case 2:
        return _ticketScreen;
      case 3:
        return _accountScreen;
      case 4:
        return _shuffleScreen;
      default:
        return _homeScreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: _getPageView(),
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
                width: 26,
                height: 26,
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
