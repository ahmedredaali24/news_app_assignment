import 'package:flutter/material.dart';
import 'package:news_app_final/api/api_manger.dart';
import 'package:news_app_final/home/taps/tap_widget.dart';
import 'package:news_app_final/model/SourceResponse.dart';
import 'package:news_app_final/model/category.dart';
import 'package:provider/provider.dart';

import '../../providers/provider_theme.dart';
import '../../themes.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = "homeScreen";
  CategoryDm categoryDm;

  CategoryDetails({super.key, required this.categoryDm});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderTheme>(context);
    return FutureBuilder<SourceResponse?>(
      future: ApiManger.getSources(widget.categoryDm.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: MyTheme.greenColor,
          ));
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                " error",
                style: TextStyle(
                    color: provider.isDark()
                        ? MyTheme.whiteColor
                        : MyTheme.blackColor),
              ),
              MaterialButton(
                onPressed: () {
                  ApiManger.getSources(widget.categoryDm.id);
                  setState(() {});
                },
                child: Text(
                  " reload",
                  style: TextStyle(
                      color: provider.isDark()
                          ? MyTheme.whiteColor
                          : MyTheme.blackColor),
                ),
              )
            ],
          );
        } else if (snapshot.data?.status != "ok") {
          return Column(
            children: [
              Text(snapshot.data!.message!,
                  style: Theme.of(context).textTheme.titleLarge),
              MaterialButton(
                  onPressed: () {
                    ApiManger.getSources(widget.categoryDm.id);
                    setState(() {});
                  },
                  child: Text(
                    "server reload",
                    style: TextStyle(
                        color: provider.isDark()
                            ? MyTheme.whiteColor
                            : MyTheme.blackColor),
                  ))
            ],
          );
        }
        var sourceList = snapshot.data?.sources ?? [];
        return TapWidgets(
          sourceList: sourceList,
        );
      },
    );
  }
}
