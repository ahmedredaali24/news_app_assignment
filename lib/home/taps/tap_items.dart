import 'package:flutter/material.dart';
import 'package:news_app_final/model/SourceResponse.dart';
import 'package:news_app_final/themes.dart';
import 'package:provider/provider.dart';

import '../../providers/provider_theme.dart';

class TapItem extends StatelessWidget {
  final Source source;
  final bool isSelected;

  const TapItem({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderTheme>(context);

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      decoration: BoxDecoration(
          border: Border.all(
              color:
                  provider.isDark() ? MyTheme.whiteColor : MyTheme.greenColor,
              width: 1),
          borderRadius: BorderRadius.circular(15),
          color: provider.isDark()
              ? isSelected
                  ? MyTheme.redColor
                  : Colors.transparent
              : isSelected
                  ? MyTheme.greenColor
                  : Colors.transparent),
      child: Text(
        source.name ?? "",
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: isSelected
                ? MyTheme.whiteColor
                : provider.isDark()
                    ? MyTheme.blackColor
                    : MyTheme.greenColor,
            fontSize: 18),
      ),
    );
  }
}
