import 'package:flutter/material.dart';
import 'package:tronald_dump/data/quote.dart';
import 'package:tronald_dump/quote_widget.dart';
import 'package:tronald_dump/tag_screen/QuotesListPresenter.dart';

class QuotesListWidget extends StatefulWidget {
  final String tag;

  const QuotesListWidget({Key key, this.tag}) : super(key: key);

  @override
  QuotesListState createState() {
    return new QuotesListState(tag);
  }
}

class _ViewState {
  bool isLoading;
  Object error;
  List<Quote> quotes;

  _ViewState(this.isLoading, this.error, this.quotes);
}

class QuotesListState extends State<QuotesListWidget>
    implements QuotesListViewContract {
  String _tag;
  QuotesListPresenter _presenter;
  _ViewState _viewState;

  QuotesListState(String tag) {
    _tag = tag;
    _presenter = QuotesListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _presenter.loadTag(_tag);
  }

  @override
  Widget build(BuildContext context) {
    print("Build QuotesListWidget: ${_viewState.quotes}");

    if (_viewState.isLoading) {
      return _createLoadingWidget();
    }

    if (_viewState.error != null) {
      return _buildErrorWidget();
    }

    return _buildQuotes(_viewState.quotes);
  }

  Widget _createLoadingWidget() {
    return Text("Loading");
  }

  Widget _buildErrorWidget() {
    return Text("Error ${_viewState.error}");
  }

  Widget _buildQuotes(List<Quote> quotes) {
    return ListView.builder(
      itemCount: quotes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: QuoteWidget(quotes[index], null, () {
            _presenter.onViewQuoteButtonClicked(quotes[index]);
          }, null),
        );
      },
    );
  }

  @override
  void displayError(Object error) {
    setState(() {
      _viewState = _ViewState(false, error, null);
    });
  }

  @override
  void displayLoading() {
    setState(() {
      _viewState = _ViewState(true, null, null);
    });
  }

  @override
  void displayQuotes(List<Quote> quotes) {
    setState(() {
      _viewState = _ViewState(false, null, quotes);
    });
  }
}
