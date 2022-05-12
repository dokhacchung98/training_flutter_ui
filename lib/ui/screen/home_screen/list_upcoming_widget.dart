import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:training_flutter_ui/configs/url_config.dart';
import 'package:training_flutter_ui/controllers/home_controller.dart';
import 'package:training_flutter_ui/ui/components/custom_slide_indicator.dart';

class ListUpcomingWidget extends StatefulWidget {
  const ListUpcomingWidget({Key? key}) : super(key: key);

  @override
  State<ListUpcomingWidget> createState() => _ListUpcomingWidgetState();
}

class _ListUpcomingWidgetState extends State<ListUpcomingWidget> {
  int _currentPageActive = 0;

  @override
  void initState() {
    super.initState();
    _getListMovieTrending();
  }

  Future _getListMovieTrending() async {}

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Column(children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 210.0,
              viewportFraction: 0.45,
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
                          height: 100,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  );
                }).toList()
              : controller.listMovieUpcoming.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
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
    );
  }
}
