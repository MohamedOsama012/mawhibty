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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Mawhibty`
  String get appTitle {
    return Intl.message('Mawhibty', name: 'appTitle', desc: '', args: []);
  }

  /// `Your journey begins... Show us your skills!`
  String get onboardingTitle1 {
    return Intl.message(
      'Your journey begins... Show us your skills!',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Every level brings you closer to your dream!\nLet’s see your magic touch.`
  String get onboardingDesc1 {
    return Intl.message(
      'Every level brings you closer to your dream!\nLet’s see your magic touch.',
      name: 'onboardingDesc1',
      desc: '',
      args: [],
    );
  }

  /// `Skills aren’t just words... Prove them!`
  String get onboardingTitle2 {
    return Intl.message(
      'Skills aren’t just words... Prove them!',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Record yourself, upload the video,\nand let the ball speak for you.`
  String get onboardingDesc2 {
    return Intl.message(
      'Record yourself, upload the video,\nand let the ball speak for you.',
      name: 'onboardingDesc2',
      desc: '',
      args: [],
    );
  }

  /// `New level? New star? Let’s go!`
  String get onboardingTitle3 {
    return Intl.message(
      'New level? New star? Let’s go!',
      name: 'onboardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Complete tasks to earn stars...\nYour path to pro starts here.`
  String get onboardingDesc3 {
    return Intl.message(
      'Complete tasks to earn stars...\nYour path to pro starts here.',
      name: 'onboardingDesc3',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Start`
  String get start {
    return Intl.message('Start', name: 'start', desc: '', args: []);
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
