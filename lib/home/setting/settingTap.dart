import 'package:flutter/material.dart';
import 'package:news_app_final/providers/provider_language.dart';
import 'package:provider/provider.dart';

import '../../providers/provider_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../themes.dart';

class SettingTap extends StatefulWidget {
  const SettingTap({super.key});

  @override
  State<SettingTap> createState() => _SettingTapState();
}

class _SettingTapState extends State<SettingTap> {
  String? language;

  @override
  Widget build(BuildContext context) {
    var providerlan = Provider.of<ProviderLanguage>(context);
    var provider = Provider.of<ProviderTheme>(context);
    bool darkMode = provider.isDark();

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*.05,
        ),
        SwitchListTile(
          value: darkMode,
          onChanged: (value) {
            provider.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
            setState(() {});
          },
          title: Text(
            AppLocalizations.of(context)!.dark_mode,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: provider.isDark()?MyTheme.whiteColor:Colors.black
            ),
          ),
          subtitle: Text(darkMode
              ? AppLocalizations.of(context)!.enabled
              : AppLocalizations.of(context)!.disabled,style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: provider.isDark()?MyTheme.whiteColor:Colors.black
          ),),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*.1,
        ),
        RadioListTile(
          dense: true,
          tileColor: Colors.transparent,
          selectedTileColor: Colors.transparent,
          selected: language == "light" ? true : false,
          title: Text(
            AppLocalizations.of(context)!.english,
            style: TextStyle(
                fontSize: 20,
                color:
                    provider.isDark() ? MyTheme.whiteColor : MyTheme.blackColor),
          ),
          onChanged: (val) {
            setState(() {
              language = val;
              providerlan.changeLanguage("en");
            });
          },
          groupValue: language,
          value: "en",
        ),
        SizedBox(
          height: 0.01 * MediaQuery.of(context).size.height,
        ),
        RadioListTile(
          tileColor: provider.isDark() ? Colors.transparent : Colors.transparent,
          selectedTileColor: Colors.transparent,
          selected: language == "ar" ? true : false,
          title: Text(
            AppLocalizations.of(context)!.arabic,
            style: TextStyle(
                fontSize: 20,
                color:
                    provider.isDark() ? MyTheme.whiteColor : MyTheme.blackColor),
          ),
          onChanged: (val) async {
            language = val;
            providerlan.changeLanguage("ar");
            setState(() {});
          },
          groupValue: language,
          value: "ar",
        ),
      ]),
    );
  }
}
