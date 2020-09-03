import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:better_me_diary/app_localizations.dart';
import 'package:better_me_diary/screens/home.dart';
import 'package:better_me_diary/screens/index.dart';
import 'package:better_me_diary/screens/login.dart';
import 'package:better_me_diary/screens/profile.dart';
import 'package:better_me_diary/screens/register.dart';
import 'package:better_me_diary/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(BetterMeDiary());
  });
}

class BetterMeDiary extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // ignore: prefer_const_literals_to_create_immutables
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('sk', 'SK'),
      ],
      // These delegates make sure that the localization data for the proper language is loaded
      // ignore: prefer_const_literals_to_create_immutables
      localizationsDelegates: [
        // A class which loads the translations from JSON files
        AppLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (final supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },

      title: 'BetterMeDiary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.index,
      routes: {
        Routes.index: (context) => IndexPage(
            title: AppLocalizations.of(context).translate('index_title')),
        Routes.login: (context) => LoginPage(
            title: AppLocalizations.of(context).translate('login_title')),
        Routes.register: (context) => RegisterPage(
            title: AppLocalizations.of(context).translate('register_title')),
        Routes.home: (context) => HomePage(
            title: AppLocalizations.of(context).translate('home_title')),
        Routes.profile: (context) => ProfilePage(
            title: AppLocalizations.of(context).translate('profile_title')),
      },
    );
  }
}
