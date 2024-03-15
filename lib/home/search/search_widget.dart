import 'package:flutter/material.dart';
import 'package:news_app_final/api/api_manger.dart';
import 'package:news_app_final/home/news/news_items.dart';
import 'package:news_app_final/model/SourceResponse.dart';
import 'package:provider/provider.dart';

import '../../new/new_detaials.dart';
import '../../providers/provider_theme.dart';
import '../../themes.dart';

class NewsSearchDelegate extends SearchDelegate {
  Source? source;

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var provider = Provider.of<ProviderTheme>(context);

    return Container(
        color: provider.isDark() ? MyTheme.blackColor : MyTheme.whiteColor,
        child: Center(
          child: Icon(Icons.search,
              size: 50,
              color:
                  provider.isDark() ? MyTheme.whiteColor : MyTheme.blackColor),
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiManger.getNewsResponse(source?.id ?? "",
          query: query, pageSize: 100),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: MyTheme.greenColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              const Text(
                "something is wrong",
                style: TextStyle(color: Colors.black),
              ),
              MaterialButton(
                  onPressed: () {
                    ApiManger.getNewsResponse(source?.id ?? "");
                  },
                  child: const Text(
                    "Reload page",
                  ))
            ],
          );
        } else if (snapshot.data?.status != "ok") {
          return Column(
            children: [
              Text(
                snapshot.data!.message!,
                style: const TextStyle(color: Colors.black),
              ),
              MaterialButton(
                  onPressed: () {
                    ApiManger.getNewsResponse(source?.id ?? "");
                  },
                  child: const Text(
                    "Reload",
                  ))
            ],
          );
        }

        var searchList = snapshot.data?.articles ?? [];
        return ListView.builder(
            itemCount: searchList.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    // Navigate to news details page and pass the article data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailsPage(
                          articles: searchList[index],
                        ),
                      ),
                    );
                  },
                  child: NewsItems(articles: searchList[index]));
            });
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
          ApiManger.getNewsResponse(source?.id ?? "");
        },
      ),
    ];
  }
}
