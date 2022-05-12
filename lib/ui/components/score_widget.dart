import 'package:flutter/material.dart';
import 'package:training_flutter_ui/style/style_gradient.dart';
import 'package:training_flutter_ui/style/style_text.dart';
import 'package:training_flutter_ui/utils/handle_score_imdb_Util.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({Key? key, required this.score}) : super(key: key);

  final double score;

  @override
  Widget build(BuildContext context) {
    final scores = HandleScoreImdbUtil.handleScore(score);
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          gradient: StyleGradient.gradientBackgroundDotActive),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(text: '${scores[0]}', style: StyleText.styleDescription),
            TextSpan(
                text: '.${scores[1]}', style: StyleText.styleNameActorCast),
          ]),
        ),
      ),
    );
  }
}
