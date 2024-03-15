import 'package:flutter/material.dart';
import 'package:news_app_final/home/taps/tap_items.dart';

import '../../model/SourceResponse.dart';
import '../news/news_widget.dart';

class TapWidgets extends StatefulWidget {
  List<Source> sourceList;

  TapWidgets({super.key, required this.sourceList});

  @override
  State<TapWidgets> createState() => _TapWidgetsState();
}

class _TapWidgetsState extends State<TapWidgets> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
                isScrollable: true,
                indicatorColor: Colors.transparent,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                tabs: widget.sourceList
                    .map((source) => TapItem(
                        source: source,
                        isSelected:
                            selectedIndex == widget.sourceList.indexOf(source)))
                    .toList()),
            Expanded(
                child: NewsWidget(source: widget.sourceList[selectedIndex]))
          ],
        ));
  }
}
