import 'package:flutter/material.dart';
import 'package:training_flutter_ui/common/app_image.dart';
import 'package:training_flutter_ui/style/style_text.dart';

class ItemActorWidget extends StatelessWidget {
  const ItemActorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 14),
      width: 50,
      child: Column(
        children: <Widget>[
          Image.asset(
            AppImage.imgActor,
            width: 50,
            height: 50,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 4),
          const Text(
            'Chris Hemsworth',
            style: StyleText.styleNameActor,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          const Text(
            'Thor',
            style: StyleText.styleNameActorCast,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
