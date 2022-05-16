import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_flutter_ui/bloc/l10n_cubit.dart';
import 'package:training_flutter_ui/bloc/l10n_state.dart';
import 'package:training_flutter_ui/common/app_image.dart';
import 'package:training_flutter_ui/common/color_constant.dart';
import 'package:training_flutter_ui/generated/l10n.dart';
import 'package:training_flutter_ui/style/style_text.dart';

class ShuffleScreen extends StatelessWidget {
  const ShuffleScreen({Key? key}) : super(key: key);

  _changeLanguage(BuildContext context, String lang) {
    L10nCubit _l10nCubit = BlocProvider.of<L10nCubit>(context, listen: false);
    if (_l10nCubit.state.currentLanguage != lang) {
      _l10nCubit.changeTheLanguage(lang);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42),
            child: Text(S.of(context).bottom_tab_setting,
                style: StyleText.styleTextTitleHome),
          ),
          Padding(
            padding: const EdgeInsets.all(42.0),
            child: Text(
              S.of(context).setting_change_lang,
              style: StyleText.styleTextCategory,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          BlocBuilder<L10nCubit, L10nState>(
            builder: (context, state) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _changeLanguage(context, 'vi'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: state.currentLanguage == 'vi'
                              ? ColorConstant.colorYellow
                              : Colors.transparent),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.asset(
                      AppImage.iconVN,
                      width: 40,
                      height: 38,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                GestureDetector(
                  onTap: () => _changeLanguage(context, 'en'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: state.currentLanguage == 'en'
                              ? ColorConstant.colorYellow
                              : Colors.transparent),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.asset(
                      AppImage.iconUK,
                      width: 40,
                      height: 38,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
