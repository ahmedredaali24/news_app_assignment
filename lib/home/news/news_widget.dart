import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/api_manger.dart';
import '../../model/NewsResponse.dart';
import '../../model/SourceResponse.dart';
import '../../new/new_detaials.dart';
import '../../providers/provider_theme.dart';
import '../../themes.dart';
import 'news_items.dart';

class NewsWidget extends StatefulWidget {
  final Source source;

  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  int currentPage = 1;
  int pageSize = 20;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderTheme>(context);

    return FutureBuilder<NewsResponse?>(
        future: ApiManger.getNewsResponse(widget.source.id ?? "",
            pageSize: pageSize, page: currentPage),
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
                Text(
                  "something is wrong",
                  style: TextStyle(
                      color: provider.isDark()
                          ? MyTheme.whiteColor
                          : MyTheme.blackColor),
                ),
                MaterialButton(
                    onPressed: () {
                      ApiManger.getNewsResponse(widget.source.id ?? "");
                      setState(() {});
                    },
                    child: Text(
                      "Reload page",
                      style: TextStyle(
                          color: provider.isDark()
                              ? MyTheme.whiteColor
                              : MyTheme.blackColor),
                    ))
              ],
            );
          } else if (snapshot.data?.status != "ok") {
            return Column(
              children: [
                Text(
                  snapshot.data!.message!,
                  style: TextStyle(
                      color: provider.isDark()
                          ? MyTheme.whiteColor
                          : MyTheme.blackColor),
                ),
                MaterialButton(
                    onPressed: () {
                      ApiManger.getNewsResponse(widget.source.id ?? "");
                      setState(() {});
                    },
                    child: Text(
                      "Reload",
                      style: TextStyle(
                          color: provider.isDark()
                              ? MyTheme.whiteColor
                              : MyTheme.blackColor),
                    ))
              ],
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                color:
                    provider.isDark() ? MyTheme.blackColor : MyTheme.blackColor,
                child: Text(
                  "$currentPage",
                  style: TextStyle(
                      color: provider.isDark()
                          ? MyTheme.whiteColor
                          : MyTheme.whiteColor),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to news details page and pass the article data
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailsPage(
                              articles: newsList[index],
                            ),
                          ),
                        );
                      },
                      child: NewsItems(articles: newsList[index]),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      if (currentPage > 1) {
                        loadPreviousPage();
                      }
                      return;
                    },
                    child: Text("Pre page: ${currentPage - 1}",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: provider.isDark()
                                ? MyTheme.whiteColor
                                : MyTheme.blackColor,
                            fontSize: 15)),
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (newsList.length == pageSize) {
                        loadNextPage();
                      }
                      return;
                    },
                    child: Text(
                      "next Page: $currentPage",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: provider.isDark()
                              ? MyTheme.whiteColor
                              : MyTheme.blackColor,
                          fontSize: 15),
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }

  Future<void> loadNextPage() async {
    setState(() {
      currentPage++;
    });
  }

  Future<void> loadPreviousPage() async {
    setState(() {
      currentPage--;
    });
  }
}
