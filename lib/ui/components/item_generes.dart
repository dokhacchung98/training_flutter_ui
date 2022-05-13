import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_flutter_ui/controllers/app_controller.dart';
import 'package:training_flutter_ui/style/style_gradient.dart';
import 'package:training_flutter_ui/style/style_text.dart';

class ItemGeneres extends StatelessWidget {
  ItemGeneres({Key? key, required this.icon, required this.title})
      : super(key: key);

  double? _widthItemGeneres;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    _widthItemGeneres ??= (MediaQuery.of(context).size.width - 140) / 4;
    return GestureDetector(
      onTap: () {
        Get.find<AppController>().showDialog("The feature is upgrading");
      },
      child: Container(
        width: _widthItemGeneres,
        decoration: BoxDecoration(
          gradient: StyleGradient.gradientBackgroundGenres,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(width: 1, color: Colors.white24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            SizedBox(
              width: _widthItemGeneres! * 0.5,
              height: _widthItemGeneres! * 0.5,
              child: Image.asset(icon),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: StyleText.styleTextGeneres,
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
