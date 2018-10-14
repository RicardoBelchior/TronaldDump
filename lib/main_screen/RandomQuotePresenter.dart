import 'package:tronald_dump/data/api.dart';
import 'package:tronald_dump/data/quote.dart';
import 'package:tronald_dump/injection/dependency_injection.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class RandomQuoteViewContract {
  void displayQuote(Quote quote);

  void displayError(Object error);

  void displayLoading();
}

class RandomQuotePresenter {
  RandomQuoteViewContract _view;
  TronaldRepository _repository;

  RandomQuotePresenter(this._view) {
    _repository = new Injector().tronaldRepository;
  }

  void loadRandomQuote() {
    assert(_view != null);

    _view.displayLoading();

    _repository
        .random()
        .then(_view.displayQuote)
        .catchError(_view.displayError);
  }

  void onRandomButtonClicked() {
    loadRandomQuote();
  }

  void onLikeButtonClicked(Quote quote) {}

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
