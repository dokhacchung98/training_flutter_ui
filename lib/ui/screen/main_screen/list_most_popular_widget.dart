import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:training_flutter_ui/common/app_image.dart';
import 'package:training_flutter_ui/common/color_constant.dart';
import 'package:training_flutter_ui/style/style_gradient.dart';
import 'package:training_flutter_ui/style/style_text.dart';
import 'package:training_flutter_ui/ui/components/custom_slide_indicator.dart';

class ListMostPopularWidget extends StatefulWidget {
  const ListMostPopularWidget({Key? key}) : super(key: key);

  @override
  State<ListMostPopularWidget> createState() => _ListMostPopularWidgetState();
}

class _ListMostPopularWidgetState extends State<ListMostPopularWidget> {
  int _currentPageActive = 0;

  @override
  void initState() {
    super.initState();
    _getListMovieTrending();
  }

  Future _getListMovieTrending() async {}

  @override
  Widget build(BuildContext context) {
    final _viewPortFraction = (MediaQuery.of(context).size.width - 96) /
        MediaQuery.of(context).size.width;

    return Column(children: [
      CarouselSlider(
        options: CarouselOptions(
            height: 120.0,
            viewportFraction: _viewPortFraction,
            enlargeCenterPage: true,
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
                height: 120,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                      image: AssetImage(AppImage.imgSlide), fit: BoxFit.fill),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: StyleGradient.gradientBackgroundItemSlide,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            'Deadpool 2',
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
                              text: const TextSpan(
                                text: 'IMDb  ',
                                style: StyleText.styleTextIMDb,
                                children: [
                                  TextSpan(
                                      text: '9.8',
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
