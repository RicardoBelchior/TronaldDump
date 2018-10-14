import 'package:tronald_dump/data/api.dart';
import 'package:tronald_dump/injection/dependency_injection.dart';

abstract class TagsViewContract {
  void displayTags(List<String> tags);

  void displayError(Object error);

  void displayLoading();
}

class TagsWidgetPresenter {

  TagsViewContract _view;
  TronaldRepository _repository;

  TagsWidgetPresenter(this._view) {
    _repository = new Injector().tronaldRepository;
  }

  void loadTags() {
    assert(_view != null);

    _view.displayLoading();

    _repository
        .getTags()
        .then(_view.displayTags)
        .catchError(_view.displayError);
  }

}
