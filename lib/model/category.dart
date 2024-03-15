import 'package:flutter/material.dart';

import '../themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryDm {
  String id;
  String title;
  Color color;
  String imagePath;

  CategoryDm(
      {required this.id,
      required this.title,
      required this.color,
      required this.imagePath});

  static List<CategoryDm> getCategories(BuildContext context) {
    return [
      CategoryDm(
          id: "sports",
          title: AppLocalizations.of(context)!.sport,
          color: MyTheme.redColor,
          imagePath: "assets/ball.png"),
      CategoryDm(
          id: "general",
          title: AppLocalizations.of(context)!.general,
          color: MyTheme.blueColor,
          imagePath: "assets/Politics.png"),
      CategoryDm(
          id: "health",
          title: AppLocalizations.of(context)!.health,
          color: MyTheme.pinkColor,
          imagePath: "assets/health.png"),
      CategoryDm(
          id: "business",
          title: AppLocalizations.of(context)!.business,
          color: MyTheme.brownColor,
          imagePath: "assets/bussines.png"),
      CategoryDm(
          id: "entertainment",
          title: AppLocalizations.of(context)!.entertainment,
          color: MyTheme.blueOpenCFColor,
          imagePath: "assets/environment.png"),
      CategoryDm(
          id: "science",
          title: AppLocalizations.of(context)!.science,
          color: MyTheme.yellowColor,
          imagePath: "assets/science.png"),
    ];
  }
}
