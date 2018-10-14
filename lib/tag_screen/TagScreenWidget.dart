import 'package:flutter/material.dart';
import 'package:tronald_dump/main_screen/RandomQuoteWidget.dart';
import 'package:tronald_dump/main_screen/TagsWidget.dart';
import 'package:tronald_dump/strings.dart';


class TagScreenWidget extends StatefulWidget {

  final String tag;

  const TagScreenWidget({Key key, this.tag}) : super(key: key);

  @override
  TagScreenWidgetState createState() {
    return new TagScreenWidgetState();
  }
}

class TagScreenWidgetState extends State<TagScreenWidget> {

  //TODO create view state, create presenter, refactor QuoteCard and add it here as a list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Topic Screen"),

        ),
        body: Text("TAG: ${widget.tag}"));
  }
}
