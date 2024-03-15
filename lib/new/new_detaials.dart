import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/NewsResponse.dart';
import '../providers/provider_theme.dart';
import '../themes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsDetailsPage extends StatefulWidget {
  static const String routeName = "NewsDetailsPage";

  Articles articles;

  NewsDetailsPage({super.key, required this.articles});

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
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
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)!.news_title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: MyTheme.whiteColor),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: widget.articles.urlToImage ?? "",
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .4,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                        backgroundColor: MyTheme.greenColor,
                      )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  // Container(
                  //   clipBehavior: Clip.antiAlias,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  //   child: Image.network(news.urlToImage??""),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.articles.author ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(widget.articles.description ?? "",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: provider.isDark()
                              ? MyTheme.whiteColor
                              : Colors.black)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    DateFormat.yMMM().format(
                        DateTime.parse(widget.articles.publishedAt ?? "")),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey),
                    textAlign: TextAlign.end,
                  ),
                   SizedBox(
                    height: MediaQuery.of(context).size.height*0.1,
                  ),

                  TextButton(
                      onPressed: () async {
                        final Uri url = Uri.parse(widget.articles.url ?? "");
                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "View Full Article",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const Icon(
                            Icons.arrow_right,
                            size: 50,
                          )
                        ],
                      ))
                ],
              ),
            ),
          ))
    ]);
  }
}
