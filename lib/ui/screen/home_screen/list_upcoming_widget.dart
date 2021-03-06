import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:training_flutter_ui/configs/url_config.dart';
import 'package:training_flutter_ui/controllers/home_controller.dart';
import 'package:training_flutter_ui/models/movie_model.dart';
import 'package:training_flutter_ui/style/style_gradient.dart';
import 'package:training_flutter_ui/ui/components/custom_slide_indicator.dart';

class ListUpcomingWidget extends StatefulWidget {
  const ListUpcomingWidget({Key? key}) : super(key: key);

  @override
  State<ListUpcomingWidget> createState() => _ListUpcomingWidgetState();
}

class _ListUpcomingWidgetState extends State<ListUpcomingWidget> {
  int _currentPageActive = 0;

  _goToDetailScreen(MovieModel item) {
    Get.toNamed("/detail-screen/${item.id}");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Stack(
        children: [
          Column(children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 220.0,
                  viewportFraction: 0.41,
                  onPageChanged: (page, _) {
                    setState(() {
                      _currentPageActive = page;
                    });
                  }),
              items: controller.isLoadingUpcoming
                  ? [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Shimmer.fromColors(
                            highlightColor: Colors.grey.shade500,
                            baseColor: Colors.grey.shade300,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 120,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }).toList()
                  : controller.listMovieUpcoming.map((item) {
                      final itemIndex =
                          controller.listMovieUpcoming.indexOf(item);
                      return Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () => _goToDetailScreen(item),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey,
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      UrlConfig.baseUrlImg(item.posterPath!,
                                          width: 500),
                                    ),
                                    fit: BoxFit.fill),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: itemIndex == _currentPageActive
                                      ? null
                                      : (itemIndex < _currentPageActive &&
                                                  _currentPageActive !=
                                                      (controller
                                                              .listMovieUpcoming
                                                              .length -
                                                          1)) ||
                                              (itemIndex ==
                                                      (controller
                                                              .listMovieUpcoming
                                                              .length -
                                                          1) &&
                                                  _currentPageActive == 0) ||
                                              (_currentPageActive ==
                                                      (controller
                                                              .listMovieUpcoming
                                                              .length -
                                                          1) &&
                                                  _currentPageActive -
                                                          itemIndex ==
                                                      1)
                                          ? StyleGradient
                                              .gradientBackgroundShadowLeft
                                          : StyleGradient
                                              .gradientBackgroundShadowRight,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
            ),
            const SizedBox(height: 10),
            CustomSlideIndicator(
                numberOfItem: controller.isLoadingUpcoming
                    ? 5
                    : controller.listMovieUpcoming.length,
                activePage: _currentPageActive),
          ]),
          IgnorePointer(
            child: Container(
              width: 80,
              height: 220,
              decoration: const BoxDecoration(
                  // gradient: StyleGradient.gradientBackgroundShadowLeft,
                  ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IgnorePointer(
              child: Container(
                width: 80,
                height: 220,
                decoration: const BoxDecoration(
                    // gradient: StyleGradient.gradientBackgroundShadowRight,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
