import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tronald_dump/data/quote.dart';
import 'package:tronald_dump/strings.dart';

/// Widget to display a quote.
/// Passing the VoidCallbacks as null, will hide the respective button.
class QuoteWidget extends StatelessWidget {
  final Quote _quote;
  final VoidCallback _onShuffleClicked;
  final VoidCallback _onOpenClicked;
  final VoidCallback _onFavoriteClicked;

  const QuoteWidget(this._quote, this._onShuffleClicked,
      this._onOpenClicked, this._onFavoriteClicked);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(children: buildTopRowChildren(context)),
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(_getFormattedDate(_quote))),
                Expanded(
                  child: ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: buildBottomRowChildren(context),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  buildTopRowChildren(BuildContext context) {
    var showRandomIcon = _onShuffleClicked != null;

    var topRowChildren = <Widget>[];
    topRowChildren.add(buildQuoteText(context));

    if (showRandomIcon) {
      topRowChildren.add(buildShuffleButton());
    }

    return topRowChildren;
  }

  buildBottomRowChildren(BuildContext context) {
    var showOpenIcon = _onOpenClicked != null;
    var showFavoriteIcon = false;
    var bottomRowChildren = <Widget>[];

    if (showFavoriteIcon) {
      bottomRowChildren.add(buildFavoriteButton());
    }

    if (showOpenIcon) {
      bottomRowChildren.add(buildOpenButton());
    }

    return bottomRowChildren;
  }

  Expanded buildQuoteText(BuildContext context) {
    return Expanded(
        child: Text(_quote.text,
            textAlign: TextAlign.start,
            style: Theme
                .of(context)
                .textTheme
                .subhead));
  }

  IconButton buildOpenButton() {
    return IconButton(
        icon: Icon(Icons.open_in_new),
        tooltip: Strings.view_quote,
        onPressed: _onOpenClicked);
  }

  IconButton buildShuffleButton() {
    return IconButton(
      icon: Icon(Icons.shuffle),
      tooltip: Strings.random_quote,
      onPressed: _onShuffleClicked,
    );
  }

  Widget buildFavoriteButton() {
    return IconButton(
        icon: Icon(Icons.favorite_border),
        tooltip: Strings.favorite,
        onPressed: _onFavoriteClicked);
  }

  String _getFormattedDate(Quote quote) {
    var formatter = new DateFormat("yyyy-MM-dd, HH:mm:ss");
    return formatter.format(quote.appearedAt);
  }

}
