import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../model/NewsResponse.dart';
import '../../themes.dart';
import 'package:intl/intl.dart';

class NewsItems extends StatelessWidget {
  final Articles articles;

  const NewsItems({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: articles.urlToImage ?? "",
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .4,
              fit: BoxFit.fill,
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                backgroundColor: MyTheme.greenColor,
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
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
            articles.author ?? "",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.grey),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(articles.title ?? "",
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(
            height: 10,
          ),
          Text(
            DateFormat.yMMM()
                .format(DateTime.parse(articles.publishedAt ?? "")),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.grey),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
