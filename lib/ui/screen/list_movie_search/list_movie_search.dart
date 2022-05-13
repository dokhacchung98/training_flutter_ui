import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:training_flutter_ui/common/app_image.dart';
import 'package:training_flutter_ui/controllers/list_movie_search_controller.dart';
import 'package:training_flutter_ui/style/style_text.dart';
import 'package:training_flutter_ui/ui/components/item_movie_search.dart';
import 'package:training_flutter_ui/ui/components/my_scaffold.dart';

class ListMovieSearch extends GetWidget<ListMovieSearchController> {
  ListMovieSearch({Key? key}) : super(key: key) {
    _controllerScroll.addListener(_scrollListener);
  }

  final ScrollController _controllerScroll = ScrollController();

  final ListMovieSearchController _listMovieSearchController =
      Get.put(ListMovieSearchController());

  Future _refreshList() async {
    _listMovieSearchController.pullToRefresh();
  }

  void _scrollListener() {
    if (_controllerScroll.position.extentAfter < 300) {
      _listMovieSearchController.goToNextPage();
    }
  }

  Widget _renderViewLoading() {
    if (_listMovieSearchController.isLoading) {
      return GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.7,
            crossAxisSpacing: 16,
            mainAxisSpacing: 12,
          ),
          itemCount: 3,
          itemBuilder: (BuildContext ctx, index) {
            return Shimmer.fromColors(
              highlightColor: Colors.grey.shade500,
              baseColor: Colors.grey.shade300,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            );
          });
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: GetBuilder<ListMovieSearchController>(
        builder: (controller) => SizedBox(
          height: double.infinity,
          child: RefreshIndicator(
            onRefresh: _refreshList,
            child: SingleChildScrollView(
              controller: _controllerScroll,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 48),
                  Row(children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        AppImage.iconBack,
                        width: 24,
                        height: 24,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    RichText(
                        text: TextSpan(children: [
                      const TextSpan(
                          text: "Search ", style: StyleText.styleTextTitleHome),
                      TextSpan(
                          text: '"${_listMovieSearchController.keyword}"',
                          style: StyleText.styleTextTitleHome),
                    ])),
                  ]),
                  const SizedBox(height: 16),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Result",
                          style: StyleText.styleTextNameMovieMedium,
                        ),
                        Text(
                          "${controller.listMovies.length}/${controller.totalElement}",
                          style: StyleText.styleDescriptionMore,
                        ),
                      ]),
                  const SizedBox(height: 8),
                  _listMovieSearchController.listMovies.isEmpty
                      ? const SizedBox()
                      : GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 12,
                          ),
                          itemCount:
                              _listMovieSearchController.listMovies.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return ItemMovieSearch(
                                searchModel: _listMovieSearchController
                                    .listMovies[index]);
                          }),
                  const SizedBox(height: 12),
                  _renderViewLoading(),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
