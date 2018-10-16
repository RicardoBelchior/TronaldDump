import 'package:flutter/material.dart';
import 'package:tronald_dump/main_screen/RandomQuoteWidget.dart';
import 'package:tronald_dump/main_screen/TagsWidget.dart';
import 'package:tronald_dump/strings.dart';

class MainScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tronald Dump"),
        ),
        body: _createContent(context));
  }

  Widget _createContent(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              _createWelcomeWidget(context),
              RandomQuoteWidget(),
              TagsWidget()
            ])));

//    return ListView(padding: EdgeInsets.all(16.0), children: <Widget>[
//      _createWelcomeWidget(context),
//      RandomQuoteWidget(),
//      TagsWidget()
//    ]);
  }

  Widget _createWelcomeWidget(BuildContext context) {
    return Center(
        child: Column(children: [
      //Text(Strings.welcome1, style: Theme.of(context).textTheme.display2),
      Padding(
        child: Text(Strings.welcome2, style: Theme.of(context).textTheme.title),
        padding: EdgeInsets.all(8.0),
      ),
    ]));
  }
}
