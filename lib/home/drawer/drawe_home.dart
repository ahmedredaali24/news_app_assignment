import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/provider_theme.dart';
import '../../themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerHome extends StatelessWidget {
  static const int categories = 1;
  static const int setting = 2;

  final Function onSideMenuItemClick;

  const DrawerHome({super.key, required this.onSideMenuItemClick});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderTheme>(context);

    return Column(
      children: [
        UserAccountsDrawerHeader(
          accountName: Center(
              child: Text(
            " ${AppLocalizations.of(context)!.news_app}!",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: provider.isDark() ? MyTheme.whiteColor : Colors.white),
          )),
          accountEmail: const Text(""),
          decoration: BoxDecoration(
              color:
                  provider.isDark() ? MyTheme.blackColor : MyTheme.greenColor),
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.categories,
              style: Theme.of(context).textTheme.titleLarge),
          leading: Icon(
            Icons.list,
            color: provider.isDark() ? MyTheme.whiteColor : MyTheme.blackColor,
            size: 35,
          ),
          onTap: () {
            onSideMenuItemClick(categories);
          },
        ),
        ListTile(
          title: Text(
            AppLocalizations.of(context)!.setting,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          leading: Icon(
            Icons.settings,
            color: provider.isDark() ? MyTheme.whiteColor : MyTheme.blackColor,
            size: 35,
          ),
          onTap: () {
            onSideMenuItemClick(setting);
          },
        ),
      ],
    );
  }
} // providerlan.appLanguage=="en"?""
