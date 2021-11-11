import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/l10n/l10n.dart';
import 'package:localization/providers/locale_provider.dart';
import 'package:provider/provider.dart';

enum SelectedLanguage {
  english,
  french,
  germany,
  arabic,
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localeData = Provider.of<LocaleProvider>(context);
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.app_bar_title),
        actions: [
          DropdownButton(
              value: localeData.locale,
              onChanged: (_) {},
              items: L10n.all
                  .map((locale) => DropdownMenuItem(
                        onTap: () {
                          localeData.setLocale(locale);
                        },
                        value: locale,
                        child: Text(L10n.getFlag(
                          locale.languageCode,
                        )),
                      ))
                  .toList())
        ],
      ),
      body: Center(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LanguageWidget(),
                Text(AppLocalizations.of(context)!.language),
                Text(AppLocalizations.of(context)!.how_are_u),
                TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: AppLocalizations.of(context)!.name),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final flag = L10n.getFlag(locale.languageCode);
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 50,
      child: Text(
        flag,
        style: const TextStyle(fontSize: 50),
      ),
    );
  }
}
