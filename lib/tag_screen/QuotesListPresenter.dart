import 'package:tronald_dump/data/api.dart';
import 'package:tronald_dump/data/quote.dart';
import 'package:tronald_dump/injection/dependency_injection.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class QuotesListViewContract {
  void displayQuotes(List<Quote> quotes);

  void displayError(Object error);

  void displayLoading();
}

class QuotesListPresenter {

  QuotesListViewContract _view;
  TronaldRepository _repository;

  QuotesListPresenter(this._view) {
    _repository = new Injector().tronaldRepository;
  }

  void loadTag(String tag) {
    assert(_view != null);

    _view.displayLoading();

    _repository
        .getTag(tag)
        .then(_view.displayQuotes)
        .catchError(_view.displayError);
  }

  void onViewQuoteButtonClicked(Quote quote) {
    _openUrl(quote.url);
  }

  void _openUrl(String url) async {
    print("Opening url: $url");

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
