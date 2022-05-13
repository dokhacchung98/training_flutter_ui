import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:training_flutter_ui/controllers/home_controller.dart';
import 'package:training_flutter_ui/models/movie_model.dart';
import 'package:training_flutter_ui/ui/components/custom_slide_indicator.dart';
import 'package:training_flutter_ui/ui/components/item_movie_slide.dart';

class ListMostPopularWidget extends StatefulWidget {
  const ListMostPopularWidget({Key? key}) : super(key: key);

  @override
  State<ListMostPopularWidget> createState() => _ListMostPopularWidgetState();
}

class _ListMostPopularWidgetState extends State<ListMostPopularWidget> {
  int _currentPageActive = 0;
  final HomeController _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final _viewPortFraction = (MediaQuery.of(context).size.width - 90) /
        MediaQuery.of(context).size.width;

    return Obx(
      () => Column(children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 130.0,
              viewportFraction: _viewPortFraction,
              enlargeCenterPage: true,
              autoPlay: true,
              onPageChanged: (page, _) {
                setState(() {
                  _currentPageActive = page;
                });
              }),
          items: _homeController.isLoadingSlide.value
              ? [1, 2, 3, 4, 5].map((_) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade500,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey,
                          ),
                          height: 120,
                        ),
                      );
                    },
                  );
                }).toList()
              : _homeController.listMovieTrending.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ItemMovieSlide(
                        movieTrendingModel: item as MovieModel,
                        currentIndex:
                            _homeController.listMovieTrending.indexOf(item),
                        pageIndex: _currentPageActive,
                        lengthList: _homeController.listMovieTrending.length,
                      );
                    },
                  );
                }).toList(),
        ),
        const SizedBox(height: 10),
        CustomSlideIndicator(
            numberOfItem: _homeController.isLoadingSlide.value
                ? 5
                : _homeController.listMovieTrending.length,
            activePage: _currentPageActive),
      ]),
    );
  }
}
