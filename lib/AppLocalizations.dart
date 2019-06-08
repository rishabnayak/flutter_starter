import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'flutter_starter',
      'update_details': 'Update Details',
      'register': 'Register',
      'logout': 'Logout',
    },
    'pt': {
      'title': 'flutter_starter',
      'update_details': 'Actualizar Detalhes',
      'register': 'Registrar',
      'logout': 'Sair',
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }

  String get updateDetails {
    return _localizedValues[locale.languageCode]['update_details'];
  }

  String get register {
    return _localizedValues[locale.languageCode]['register'];
  }

  String get logout {
    return _localizedValues[locale.languageCode]['logout'];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'pt'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
