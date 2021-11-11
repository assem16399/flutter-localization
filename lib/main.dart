import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/providers/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Locale?> retrieveSelectedLocal() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('selectedLocale')) return const Locale('en');
    final selectedLocaleData =
        json.decode(prefs.getString('selectedLocale')!) as Map<String, dynamic>;
    if (!L10n.all.contains(Locale(selectedLocaleData['languageCode']))) return const Locale('en');

    final locale = Locale(selectedLocaleData['languageCode']);
    return locale;
  }

  Locale? locale = const Locale('en');

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    retrieveSelectedLocal().then((locale) {
      setState(() {
        this.locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LocaleProvider>(
        create: (context) => LocaleProvider(),
        builder: (context, _) {
          return Consumer<LocaleProvider>(
            builder: (context, localeProviderData, _) => MaterialApp(
              locale: localeProviderData.locale ?? locale,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: L10n.all,
              home: const HomeScreen(),
            ),
          );
        });
  }
}
