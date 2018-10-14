import 'package:flutter/material.dart';
import 'package:tronald_dump/tag_screen/QuotesListWidget.dart';

class TagScreenWidget extends StatelessWidget {
  final String tag;

  const TagScreenWidget({Key key, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(tag),
        ),
        body: QuotesListWidget(tag: tag));
  }
}
