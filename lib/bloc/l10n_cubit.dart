import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:training_flutter_ui/bloc/l10n_state.dart';

class L10nCubit extends Cubit<L10nState> with HydratedMixin {
  L10nCubit() : super(const InitialAppLanguage());

  changeTheLanguage(String lang) {
    emit(ChangeTheAppLanguage(lang));
    Get.updateLocale(Locale(lang));
  }

  @override
  L10nState? fromJson(Map<String, dynamic> json) {
    return ChangeTheAppLanguage(json["app_lang"]);
  }

  @override
  Map<String, dynamic>? toJson(L10nState state) {
    return {"app_lang": state.currentLanguage};
  }
}
