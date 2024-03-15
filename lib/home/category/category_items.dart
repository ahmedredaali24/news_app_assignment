import 'package:flutter/material.dart';
import 'package:news_app_final/model/category.dart';
import 'package:news_app_final/themes.dart';
import 'package:provider/provider.dart';

import '../../providers/provider_theme.dart';

class CategoryItem extends StatelessWidget {
  CategoryDm categoryDm;
  int index;

  CategoryItem({super.key, required this.categoryDm, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderTheme>(context);

    return Container(
      decoration: BoxDecoration(
          color: categoryDm.color,
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(25),
            topLeft: const Radius.circular(25),
            bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
            bottomRight: Radius.circular(index % 2 == 0 ? 0 : 25),
          )),
      child: Column(
        children: [
          Image.asset(
            categoryDm.imagePath,
            height: MediaQuery.of(context).size.height * .15,
          ),
          Text(
            categoryDm.title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: provider.isDark()
                    ? MyTheme.whiteColor
                    : MyTheme.whiteColor),
          )
        ],
      ),
    );
  }
}
