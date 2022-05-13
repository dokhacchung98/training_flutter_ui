import 'package:flutter/material.dart';
import 'package:training_flutter_ui/style/style_text.dart';

class ShuffleScreen extends StatelessWidget {
  const ShuffleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text('Shuffle', style: StyleText.styleTextTitleHome),
          ),
          Expanded(
            child: Center(
              child: Text(
                'The feature is upgrading',
                style: StyleText.styleTextCategory,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
