import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_flutter_ui/configs/url_config.dart';
import 'package:training_flutter_ui/models/movie_search_model.dart';
import 'package:training_flutter_ui/style/style_gradient.dart';
import 'package:training_flutter_ui/style/style_text.dart';
import 'package:training_flutter_ui/ui/components/score_widget.dart';
import 'package:training_flutter_ui/utils/handle_time_util.dart';

class ItemMovieSearch extends StatelessWidget {
  const ItemMovieSearch({Key? key, required this.searchModel})
      : super(key: key);

  final MovieSearchModel searchModel;

  _goToDetailMovie() {
    Get.toNamed("/detail-screen/${searchModel.id}");
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
                UrlConfig.baseUrlImg(
                    searchModel.posterPath ??
                        '/6uChT8jRjTwcVo4X5pIUctsl1qN.jpg',
                    width: 500),
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
                  score: searchModel.voteAverage!,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          '${HandleTimeUtil.handleYearRelease(searchModel.releaseDate ?? '2022-01-01')} \n',
                      style: StyleText.styleTextGeneres,
                    ),
                    TextSpan(
                      text: searchModel.title ?? '',
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
