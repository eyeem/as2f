import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/src/plural_rules.dart' as plural_rules;

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

//This file is automatically generated. DO NOT EDIT, all your changes would be lost.
class S implements WidgetsLocalizations {
  const S();

  static const GeneratedLocalizationsDelegate delegate =
      GeneratedLocalizationsDelegate();

  static S of(BuildContext context) => Localizations.of<S>(context, S);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String carrot(int quantity, String num) {
    plural_rules.startRuleEvaluation(quantity);
    final pluralCase =
        plural_rules.pluralRules["en"]() as plural_rules.PluralCase;
    switch (pluralCase) {
      case plural_rules.PluralCase.ONE:
        return "${num} carrot";
      case plural_rules.PluralCase.OTHER:
        return "${num} carrots";
      default:
        return "";
    }
  }
}

class $pl extends S {
  const $pl();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String carrot(int quantity, String num) {
    plural_rules.startRuleEvaluation(quantity);
    final pluralCase =
        plural_rules.pluralRules["pl"]() as plural_rules.PluralCase;
    switch (pluralCase) {
      case plural_rules.PluralCase.ONE:
        return "${num} marchewka";
      case plural_rules.PluralCase.FEW:
        return "${num} marchewki";
      case plural_rules.PluralCase.MANY:
        return "${num} marchewek";
      default:
        return "";
    }
  }
}

class $en extends S {
  const $en();
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", null),
      Locale("pl", null),
    ];
  }

  LocaleListResolutionCallback listResolution({Locale fallback}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported);
      }
    };
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported);
    };
  }

  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported) {
    if (locale == null || !isSupported(locale)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  @override
  Future<S> load(Locale locale) {
    final String lang = getLang(locale);
    if (lang != null) {
      switch (lang) {
        case "en":
          return SynchronousFuture<S>(const $en());
        case "pl":
          return SynchronousFuture<S>(const $pl());
        default:
        // NO-OP.
      }
    }
    return SynchronousFuture<S>(const S());
  }

  @override
  bool isSupported(Locale locale) =>
      locale != null && supportedLocales.contains(locale);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;
}

String getLang(Locale l) => l == null
    ? null
    : l.countryCode != null && l.countryCode.isEmpty
        ? l.languageCode
        : l.toString();
