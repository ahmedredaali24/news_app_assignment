import 'package:flutter/material.dart';
import 'package:news_app_final/home/category/category_details.dart';
import 'package:news_app_final/home/search/search_widget.dart';
import 'package:news_app_final/home/setting/settingTap.dart';
import 'package:news_app_final/model/category.dart';
import 'package:provider/provider.dart';

import '../providers/provider_theme.dart';
import '../themes.dart';
import 'category/category_fragment.dart';
import 'drawer/drawe_home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderTheme>(context);
    return Stack(children: [
      Container(
        color: MyTheme.whiteColor,
        child: Image.asset(
          provider.isDark()
              ? "assets/dark_backgraound.jpg"
              : "assets/pattern.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [
              selectedCategory == null
                  ? IconButton(
                      onPressed: () {
                        showSearch(
                            context: context, delegate: NewsSearchDelegate());
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 35,
                      ))
                  : const Text(""),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.13,
              ),
            ],
            centerTitle: true,
            title: Text(
              selectedMenuItem == DrawerHome.setting
                  ? AppLocalizations.of(context)!.setting
                  : selectedCategory == null
                      ? AppLocalizations.of(context)!.news_app
                      : selectedCategory!.title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: provider.isDark()
                      ? MyTheme.whiteColor
                      : MyTheme.whiteColor),
            ),
          ),
          drawer: Drawer(
            child: DrawerHome(onSideMenuItemClick: onSideMenuItemClick),
          ),
          body: selectedMenuItem == DrawerHome.setting
              ? const SettingTap()
              : selectedCategory == null
                  ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
                  : CategoryDetails(categoryDm: selectedCategory!))
    ]);
  }

  CategoryDm? selectedCategory;

  void onCategoryItemClick(CategoryDm newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int selectedMenuItem = DrawerHome.categories;

  void onSideMenuItemClick(int newSelectedMenuItem) {
    selectedMenuItem = newSelectedMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
