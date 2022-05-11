import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:training_flutter_ui/common/app_image.dart';
import 'package:training_flutter_ui/common/color_constant.dart';
import 'package:training_flutter_ui/style/style_gradient.dart';
import 'package:training_flutter_ui/style/style_text.dart';
import 'package:training_flutter_ui/ui/components/my_scafflod.dart';
import 'package:training_flutter_ui/ui/screen/detail_screen/item_actor_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImage.imgHatter),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 46, vertical: 54),
            child: GestureDetector(
              child: Image.asset(
                AppImage.iconBack,
                width: 24,
                height: 24,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.blue,
                gradient: StyleGradient.gradientBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
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
                    const Text(
                      'Thor',
                      style: StyleText.styleTextNameMovieLarge,
                    ),
                    const Text(
                      'The Dark World',
                      style: StyleText.styleTextNameMovieMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Row(
                        children: [
                          Container(
                            child: const Text(
                              'Action',
                              style: StyleText.styleTextCategory,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                gradient:
                                    StyleGradient.gradientBackgroundGenres),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            child: const Text(
                              '16+',
                              style: StyleText.styleTextCategory,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                gradient:
                                    StyleGradient.gradientBackgroundGenres),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorConstant.colorYellow,
                            ),
                            child: Center(
                              child: RichText(
                                text: const TextSpan(
                                  text: 'IMDb  ',
                                  style: StyleText.styleTextIMDbLarge,
                                  children: [
                                    TextSpan(
                                        text: '9.8',
                                        style:
                                            StyleText.styleTextIMDbScoreLarge)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Image.asset(
                            AppImage.iconShare,
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 12),
                          Image.asset(
                            AppImage.iconHeart,
                            width: 24,
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                            style: StyleText.styleTextCategory,
                            text:
                                "When the Dark Elves attempt to plunge the universe into darkness, Thor must embark on a perilous and personal journey that will reunite him with doctor Jane ..."),
                        TextSpan(
                          text: "More",
                          style: StyleText.styleDescriptionMore,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Single tapped.
                            },
                        ),
                      ]),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Cast', style: StyleText.styleTextTitleHome),
                        Text('See all', style: StyleText.styleDescription),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ItemActorWidget(),
                        itemCount: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
