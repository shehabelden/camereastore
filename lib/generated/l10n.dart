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

  /// `New Cameras`
  String get cameras_new {
    return Intl.message(
      'New Cameras',
      name: 'cameras_new',
      desc: '',
      args: [],
    );
  }

  /// `Used Cameras`
  String get cameras_used {
    return Intl.message(
      'Used Cameras',
      name: 'cameras_used',
      desc: '',
      args: [],
    );
  }

  /// `New Lenses`
  String get lenses_new {
    return Intl.message(
      'New Lenses',
      name: 'lenses_new',
      desc: '',
      args: [],
    );
  }

  /// `Used Lenses`
  String get lenses_used {
    return Intl.message(
      'Used Lenses',
      name: 'lenses_used',
      desc: '',
      args: [],
    );
  }

  /// `Lighting Equipment`
  String get lighting_equipment {
    return Intl.message(
      'Lighting Equipment',
      name: 'lighting_equipment',
      desc: '',
      args: [],
    );
  }

  /// `Chargers and Batteries`
  String get chargers_batteries {
    return Intl.message(
      'Chargers and Batteries',
      name: 'chargers_batteries',
      desc: '',
      args: [],
    );
  }

  /// `Straps`
  String get straps {
    return Intl.message(
      'Straps',
      name: 'straps',
      desc: '',
      args: [],
    );
  }

  /// `Camera Bags`
  String get camera_bags {
    return Intl.message(
      'Camera Bags',
      name: 'camera_bags',
      desc: '',
      args: [],
    );
  }

  /// `Filters, Hoods, and Lens Caps`
  String get filters_hoods_lens_caps {
    return Intl.message(
      'Filters, Hoods, and Lens Caps',
      name: 'filters_hoods_lens_caps',
      desc: '',
      args: [],
    );
  }

  /// `Cases`
  String get cases {
    return Intl.message(
      'Cases',
      name: 'cases',
      desc: '',
      args: [],
    );
  }

  /// `Screen Protectors`
  String get screen_protectors {
    return Intl.message(
      'Screen Protectors',
      name: 'screen_protectors',
      desc: '',
      args: [],
    );
  }

  /// `Cables`
  String get cables {
    return Intl.message(
      'Cables',
      name: 'cables',
      desc: '',
      args: [],
    );
  }

  /// `Memory Cards and Flash Drives`
  String get memory_cards_flash_drives {
    return Intl.message(
      'Memory Cards and Flash Drives',
      name: 'memory_cards_flash_drives',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
