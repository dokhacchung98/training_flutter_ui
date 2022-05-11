import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:training_flutter_ui/common/app_image.dart';
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
    return Column(children: [
      CarouselSlider(
        options: CarouselOptions(
            height: 210.0,
            viewportFraction: 0.45,
            onPageChanged: (page, _) {
              setState(() {
                _currentPageActive = page;
              });
            }),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                      image: AssetImage(AppImage.imgVideo), fit: BoxFit.fill),
                ),
              );
            },
          );
        }).toList(),
      ),
      const SizedBox(height: 10),
      CustomSlideIndicator(numberOfItem: 5, activePage: _currentPageActive),
    ]);
  }
}
