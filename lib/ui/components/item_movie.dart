import 'package:flutter/material.dart';
import 'package:training_flutter_ui/common/app_image.dart';
import 'package:training_flutter_ui/style/style_gradient.dart';
import 'package:training_flutter_ui/style/style_text.dart';
import 'package:training_flutter_ui/ui/components/score_widget.dart';

class ItemMovie extends StatelessWidget {
  const ItemMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage(AppImage.imgVideo), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: StyleGradient.gradientBackgroundItemSlide,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: ScoreWidget(
                score: 5.3,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: RichText(
                  text: const TextSpan(
                children: [
                  TextSpan(
                    text: '2929\n',
                    style: StyleText.styleTextGeneres,
                  ),
                  TextSpan(
                    text: 'djkahs dkljakldjakl',
                    style: StyleText.styleTextGeneres,
                  )
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
