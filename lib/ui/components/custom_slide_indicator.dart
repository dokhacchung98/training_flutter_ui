import 'package:flutter/material.dart';
import 'package:training_flutter_ui/style/style_gradient.dart';

class CustomSlideIndicator extends StatelessWidget {
  final int numberOfItem;
  final int activePage;

  CustomSlideIndicator(
      {Key? key, required this.numberOfItem, required this.activePage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<int>.generate(numberOfItem, (i) => i).map((item) {
          return Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              gradient: activePage == item
                  ? StyleGradient.gradientBackgroundDotActive
                  : StyleGradient.gradientBackgroundDotInactive,
              borderRadius: const BorderRadius.all(Radius.circular(6)),
            ),
          );
        }).toList());
  }
}
