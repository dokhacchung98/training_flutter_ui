import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_flutter_ui/common/color_constant.dart';
import 'package:training_flutter_ui/configs/url_config.dart';
import 'package:training_flutter_ui/models/movie_model.dart';
import 'package:training_flutter_ui/style/style_gradient.dart';
import 'package:training_flutter_ui/style/style_text.dart';

class ItemMovieSlide extends StatelessWidget {
  const ItemMovieSlide({Key? key, required this.movieTrendingModel})
      : super(key: key);

  final MovieModel movieTrendingModel;

  _goToMovieDetail() {
    Get.toNamed("/detail-screen/${movieTrendingModel.id}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _goToMovieDetail,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 120,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey,
          image: DecorationImage(
              image: CachedNetworkImageProvider(
                UrlConfig.baseUrlImg(movieTrendingModel.backdropPath!,
                    width: 500),
              ),
              fit: BoxFit.fill),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: StyleGradient.gradientBackgroundItemSlide,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    movieTrendingModel.title ?? '',
                    maxLines: 3,
                    style: StyleText.styleTextMovieSlide,
                  ),
                ),
                Container(
                  height: 14,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorConstant.colorYellow,
                  ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'IMDb  ',
                        style: StyleText.styleTextIMDb,
                        children: [
                          TextSpan(
                              text:
                                  '${movieTrendingModel.voteAverage ?? '5.0'}',
                              style: StyleText.styleTextIMDbScore)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
