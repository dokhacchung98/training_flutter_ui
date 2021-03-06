import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_flutter_ui/configs/url_config.dart';
import 'package:training_flutter_ui/models/movie_favorite_model.dart';
import 'package:training_flutter_ui/style/style_gradient.dart';
import 'package:training_flutter_ui/style/style_text.dart';
import 'package:training_flutter_ui/ui/components/score_widget.dart';
import 'package:training_flutter_ui/utils/handle_time_util.dart';

class ItemMovie extends StatelessWidget {
  const ItemMovie({Key? key, required this.favoriteModel}) : super(key: key);

  final MovieFavoriteModel favoriteModel;

  _goToDetailMovie() {
    Get.toNamed("/detail-screen/${favoriteModel.id}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _goToDetailMovie,
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: CachedNetworkImageProvider(
                UrlConfig.baseUrlImg(favoriteModel.posterPath!, width: 500),
              ),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey,
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
              Align(
                alignment: Alignment.topRight,
                child: ScoreWidget(
                  score: favoriteModel.voteAverage!,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          '${HandleTimeUtil.handleYearRelease(favoriteModel.releaseDate ?? '2022')} \n',
                      style: StyleText.styleTextGeneres,
                    ),
                    TextSpan(
                      text: favoriteModel.title ?? '',
                      style: StyleText.styleDescription,
                    )
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
