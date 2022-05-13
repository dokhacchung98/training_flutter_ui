import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:training_flutter_ui/common/app_image.dart';
import 'package:training_flutter_ui/common/color_constant.dart';
import 'package:training_flutter_ui/configs/url_config.dart';
import 'package:training_flutter_ui/controllers/app_controller.dart';
import 'package:training_flutter_ui/controllers/detail_controller.dart';
import 'package:training_flutter_ui/models/movie_detail_model.dart';
import 'package:training_flutter_ui/style/style_gradient.dart';
import 'package:training_flutter_ui/style/style_text.dart';
import 'package:training_flutter_ui/ui/components/my_scaffold.dart';

class DetailScreen extends GetWidget<DetailController> {
  final DetailController _detailController = Get.put(DetailController());

  DetailScreen({Key? key}) : super(key: key);

  _addToFavorite() {
    _detailController.addOrRemoveToFavorite();
  }

  _showDialog(String message) {
    AppController _appController = Get.find<AppController>();
    _appController.showDialog(message);
  }

  _panUpdate(DragUpdateDetails details) {
    _detailController.handlePan(details);
  }

  _panEnd(_) {
    _detailController.handlePanEnd();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: Obx(() {
        return Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              child: controller.isLoading.value
                  ? Shimmer.fromColors(
                      highlightColor: Colors.grey.shade500,
                      baseColor: Colors.grey.shade300,
                      enabled: controller.isLoading.value,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.6,
                        color: Colors.grey,
                      ),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: controller.movieDetailModel.value == null
                              ? const AssetImage(AppImage.imgHatter)
                              : CachedNetworkImageProvider(
                                  UrlConfig.baseUrlImg(
                                      controller
                                          .movieDetailModel.value!.posterPath!,
                                      width: 500),
                                ) as ImageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GestureDetector(
                onPanUpdate: _panUpdate,
                onPanEnd: _panEnd,
                child: AnimatedPadding(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 500),
                  padding:
                      EdgeInsets.only(top: controller.valueOfPaddingTop.value),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      gradient: StyleGradient.gradientBackground,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SafeArea(
                      bottom: false,
                      top: controller.valueOfPaddingTop.value <= 100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 46),
                        child: Column(
                          children: [
                            Container(
                              width: 40,
                              height: 1,
                              color: ColorConstant.colorWhite100,
                              margin: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    controller.isLoading.value
                                        ? Shimmer.fromColors(
                                            highlightColor:
                                                Colors.grey.shade500,
                                            baseColor: Colors.grey.shade300,
                                            child: Container(
                                              height: 70,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.grey,
                                              ),
                                            ),
                                          )
                                        : Text(
                                            _detailController.firstName.value,
                                            style: StyleText
                                                .styleTextNameMovieLarge,
                                          ),
                                    controller.lastName.value.isEmpty
                                        ? const SizedBox()
                                        : Text(
                                            _detailController.lastName.value,
                                            style: StyleText
                                                .styleTextNameMovieMedium,
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (!controller.isLoading.value)
                                            Expanded(
                                              child: Wrap(
                                                children: controller
                                                    .listType.value
                                                    .map((item) {
                                                  final genes = item as Genres;
                                                  return Container(
                                                    child: Text(
                                                      genes.name ?? '',
                                                      style: StyleText
                                                          .styleTextCategory,
                                                    ),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10,
                                                        vertical: 4),
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 8,
                                                            bottom: 8),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    20)),
                                                        gradient: StyleGradient
                                                            .gradientBackgroundGenres),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          !controller.isLoading.value
                                              ? Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 20, left: 12),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8,
                                                      vertical: 3),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: ColorConstant
                                                        .colorYellow,
                                                  ),
                                                  child: Center(
                                                    child: RichText(
                                                      text: TextSpan(
                                                        text: 'IMDb  ',
                                                        style: StyleText
                                                            .styleTextIMDbLarge,
                                                        children: [
                                                          TextSpan(
                                                              text:
                                                                  '${controller.score.value}',
                                                              style: StyleText
                                                                  .styleTextIMDbScoreLarge)
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Expanded(
                                                  child: Shimmer.fromColors(
                                                    highlightColor:
                                                        Colors.grey.shade500,
                                                    baseColor:
                                                        Colors.grey.shade300,
                                                    child: Container(
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                          if (!controller.isLoading.value)
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: () =>
                                                      _showDialog("Share"),
                                                  child: Image.asset(
                                                    AppImage.iconShare,
                                                    width: 24,
                                                    height: 24,
                                                  ),
                                                ),
                                                const SizedBox(width: 12),
                                                GestureDetector(
                                                  onTap: _addToFavorite,
                                                  child: Image.asset(
                                                    AppImage.iconHeart,
                                                    width: 24,
                                                    height: 24,
                                                    color: controller
                                                            .isFavorite.value
                                                        ? Colors.red
                                                        : Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                    controller.isLoading.value
                                        ? Shimmer.fromColors(
                                            highlightColor:
                                                Colors.grey.shade500,
                                            baseColor: Colors.grey.shade300,
                                            child: Container(
                                              height: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.grey,
                                              ),
                                            ),
                                          )
                                        : RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  style: StyleText
                                                      .styleTextCategory,
                                                  text: controller
                                                      .description.value),
                                              TextSpan(
                                                text:
                                                    controller.isShowMore.value
                                                        ? "More"
                                                        : '',
                                                style: StyleText
                                                    .styleDescriptionMore,
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        controller
                                                            .showMoreDes();
                                                      },
                                              ),
                                            ]),
                                          ),
                                    // const SizedBox(height: 12),
                                    // const Text(
                                    //   'Cast',
                                    //   style: StyleText.styleTextTitleHome,
                                    // ),
                                    // const SizedBox(height: 12),
                                    // Expanded(
                                    //   child: ListView.builder(
                                    //     scrollDirection: Axis.horizontal,
                                    //     itemBuilder: (context, index) => ItemActorWidget(),
                                    //     itemCount: 8,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 46, vertical: 54),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  AppImage.iconBack,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
