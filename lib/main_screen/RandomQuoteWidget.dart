import 'package:flutter/material.dart';
import 'package:tronald_dump/data/quote.dart';
import 'package:tronald_dump/main_screen/RandomQuotePresenter.dart';
import 'package:tronald_dump/quote_widget.dart';

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

  Widget _buildQuote(Quote quote) {
    var _onShuffleClicked = () {
      _presenter.onRandomButtonClicked();
    };
    var _onOpenClicked = () {
      _presenter.onViewQuoteButtonClicked(_viewState.quote);
    };
    return QuoteWidget(_viewState.quote, _onShuffleClicked, _onOpenClicked, null);
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
}

class _ViewState {
  bool isLoading;
  Object error;
  Quote quote;

  _ViewState(this.isLoading, this.error, this.quote);
}
