// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get bottom_tab_home {
    return Intl.message(
      'Home',
      name: 'bottom_tab_home',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get bottom_tab_favorite {
    return Intl.message(
      'Favorite',
      name: 'bottom_tab_favorite',
      desc: '',
      args: [],
    );
  }

  /// `Ticket`
  String get bottom_tab_ticket {
    return Intl.message(
      'Ticket',
      name: 'bottom_tab_ticket',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get bottom_tab_account {
    return Intl.message(
      'Account',
      name: 'bottom_tab_account',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get bottom_tab_setting {
    return Intl.message(
      'Setting',
      name: 'bottom_tab_setting',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get home_hello {
    return Intl.message(
      'Hello',
      name: 'home_hello',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get home_search {
    return Intl.message(
      'Search',
      name: 'home_search',
      desc: '',
      args: [],
    );
  }

  /// `Most popular`
  String get home_popular {
    return Intl.message(
      'Most popular',
      name: 'home_popular',
      desc: '',
      args: [],
    );
  }

  /// `Genres`
  String get home_genres {
    return Intl.message(
      'Genres',
      name: 'home_genres',
      desc: '',
      args: [],
    );
  }

  /// `TV Series`
  String get home_tv {
    return Intl.message(
      'TV Series',
      name: 'home_tv',
      desc: '',
      args: [],
    );
  }

  /// `Movies`
  String get home_movies {
    return Intl.message(
      'Movies',
      name: 'home_movies',
      desc: '',
      args: [],
    );
  }

  /// `The theatre`
  String get home_theatre {
    return Intl.message(
      'The theatre',
      name: 'home_theatre',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming releases`
  String get home_release {
    return Intl.message(
      'Upcoming releases',
      name: 'home_release',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get detail_more {
    return Intl.message(
      'More',
      name: 'detail_more',
      desc: '',
      args: [],
    );
  }

  /// `Get list movie favorite error, please try again!`
  String get favorite_fetch_er {
    return Intl.message(
      'Get list movie favorite error, please try again!',
      name: 'favorite_fetch_er',
      desc: '',
      args: [],
    );
  }

  /// `Change the language`
  String get setting_change_lang {
    return Intl.message(
      'Change the language',
      name: 'setting_change_lang',
      desc: '',
      args: [],
    );
  }

  /// `Add to favorite success`
  String get add_favorite_ss {
    return Intl.message(
      'Add to favorite success',
      name: 'add_favorite_ss',
      desc: '',
      args: [],
    );
  }

  /// `Add to favorite error`
  String get add_favorite_er {
    return Intl.message(
      'Add to favorite error',
      name: 'add_favorite_er',
      desc: '',
      args: [],
    );
  }

  /// `Remove to favorite success`
  String get remove_favorite_ss {
    return Intl.message(
      'Remove to favorite success',
      name: 'remove_favorite_ss',
      desc: '',
      args: [],
    );
  }

  /// `Remove to favorite error`
  String get remove_favorite_er {
    return Intl.message(
      'Remove to favorite error',
      name: 'remove_favorite_er',
      desc: '',
      args: [],
    );
  }

  /// `The feature is upgrading`
  String get upgrading {
    return Intl.message(
      'The feature is upgrading',
      name: 'upgrading',
      desc: '',
      args: [],
    );
  }

  /// `List empty`
  String get list_empty {
    return Intl.message(
      'List empty',
      name: 'list_empty',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
