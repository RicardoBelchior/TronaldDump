import 'package:flutter/material.dart';
import 'package:tronald_dump/data/quote.dart';
import 'package:tronald_dump/main_screen/RandomQuotePresenter.dart';
import 'package:tronald_dump/strings.dart';
import 'package:intl/intl.dart';

class RandomQuoteWidget extends StatefulWidget {
  @override
  _RandomQuoteWidgetState createState() {
    return new _RandomQuoteWidgetState();
  }
}

class _RandomQuoteWidgetState extends State<RandomQuoteWidget>
    implements RandomQuoteViewContract {
  RandomQuotePresenter _presenter;
  _ViewState _viewState;

  _RandomQuoteWidgetState() {
    _presenter = RandomQuotePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _presenter.loadRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    print("Build RandomQuoteWidget: ${_viewState.quote}");

    if (_viewState.isLoading) {
      return _createLoadingWidget();
    }

    if (_viewState.error != null) {
      return _buildErrorWidget();
    }

    return _buildQuote(_viewState.quote);
  }

  Widget _createLoadingWidget() {
    return Card(
        child: Center(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircularProgressIndicator())));
  }

  Widget _buildErrorWidget() {
    return Card(child: Center(child: Text("Oops: ${_viewState.error}")));
  }

  Card _buildQuote(Quote quote) {
    return Card(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(children: <Widget>[
            Expanded(
                child: Text(quote.text,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subhead)),
            IconButton(
              icon: Icon(Icons.shuffle),
              tooltip: Strings.random_quote,
              onPressed: () {
                _presenter.onRandomButtonClicked();
              },
            )
          ]),
        ),
        Row(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(getFormattedDate(quote))),
            Expanded(
              child: ButtonTheme.bar(
                // make buttons use the appropriate styles for cards
                child: ButtonBar(
                  children: <Widget>[
//                    IconButton(
//                        icon: Icon(Icons.favorite_border),
//                        tooltip: Strings.favorite,
//                        onPressed: () {
//                          _presenter.onLikeButtonClicked(_qupte);
//                        }),
                    IconButton(
                        icon: Icon(Icons.open_in_new),
                        tooltip: Strings.view_quote,
                        onPressed: () {
                          _presenter.onViewQuoteButtonClicked(quote);
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }

  @override
  void displayError(Object error) {
    setState(() {
      _viewState = _ViewState(false, error, null);
    });
  }

  @override
  void displayQuote(Quote quote) {
    setState(() {
      _viewState = _ViewState(false, null, quote);
    });
  }

  @override
  void displayLoading() {
    setState(() {
      _viewState = _ViewState(true, null, null);
    });
  }

  String getFormattedDate(Quote quote) {
    var formatter = new DateFormat("yyyy-MM-dd, HH:mm:ss");
    return formatter.format(quote.appearedAt);
  }
}

class _ViewState {
  bool isLoading;
  Object error;
  Quote quote;

  _ViewState(this.isLoading, this.error, this.quote);
}
