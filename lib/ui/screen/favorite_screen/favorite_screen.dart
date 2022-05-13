import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_flutter_ui/controllers/app_controller.dart';
import 'package:training_flutter_ui/style/style_text.dart';
import 'package:training_flutter_ui/ui/components/item_movie.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text('Favorite', style: StyleText.styleTextTitleHome),
          ),
          const SizedBox(height: 8),
          GetBuilder<AppController>(
            builder: (_appController) => Expanded(
              child: _appController.listMovieFavorite.isEmpty
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        'List empty',
                        style: StyleText.styleTextCategory,
                        textAlign: TextAlign.center,
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 24),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: _appController.listMovieFavorite.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return ItemMovie(
                          favoriteModel:
                              _appController.listMovieFavorite[index],
                        );
                      }),
            ),
          ),
        ],
      ),
    );
  }
}
