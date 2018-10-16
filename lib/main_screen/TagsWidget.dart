import 'package:flutter/material.dart';
import 'package:tronald_dump/main_screen/TagsWidgetPresenter.dart';
import 'package:tronald_dump/routes.dart';

class TagsWidget extends StatefulWidget {
  @override
  TagsWidgetState createState() {
    return new TagsWidgetState();
  }
}

class _ViewState {
  bool isLoading;
  Object error;
  List<String> tags;

  _ViewState(this.isLoading, this.error, this.tags);
}

class TagsWidgetState extends State<TagsWidget> implements TagsViewContract {
  TagsWidgetPresenter _presenter;
  _ViewState _viewState;

  TagsWidgetState() {
    _presenter = TagsWidgetPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _presenter.loadTags();
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
  void displayTags(List<String> tags) {
    setState(() {
      _viewState = _ViewState(false, null, tags);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Build TagsWidget: ${_viewState.tags}");

    if (_viewState.isLoading) {
      return _createLoadingWidget();
    }

    if (_viewState.error != null) {
      return _buildErrorWidget();
    }

    return _buildTags(_viewState.tags);
  }

  Widget _createLoadingWidget() {
    return Text("Loading");
  }

  Widget _buildErrorWidget() {
    return Text("Error ${_viewState.error}");
  }

  Widget _buildTags(List<String> tags) {
    return _ChipsTile(
        key: Key("key-1"),
        label: "Trending topics",
        children: tags.map(_createChip).toList());
  }

  Widget _createChip(String tag) {
    return ActionChip(
      key: ValueKey<String>(tag),
      label: Text(tag),
      onPressed: () {
        //print("PRESSED: $tag");
        //Navigator.pushNamed(context, Routes.tag);
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => Routes.tag(tag))
        );
      },
    );
  }
}

class _ChipsTile extends StatelessWidget {
  const _ChipsTile({
    Key key,
    this.label,
    this.children,
  }) : super(key: key);

  final String label;
  final List<Widget> children;

  // Wraps a list of chips into a ListTile for display as a section in the demo.
  @override
  Widget build(BuildContext context) {
    final List<Widget> cardChildren = <Widget>[
      Container(
        padding: const EdgeInsets.only(top: 16.0, bottom: 4.0),
        alignment: Alignment.center,
        child: Text(label, textAlign: TextAlign.start),
      ),
    ];
    if (children.isNotEmpty) {
      cardChildren.add(Wrap(
          children: children.map<Widget>((Widget chip) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: chip,
        );
      }).toList()));
    } else {
      final TextStyle textStyle = Theme.of(context)
          .textTheme
          .caption
          .copyWith(fontStyle: FontStyle.italic);
      cardChildren.add(Semantics(
        container: true,
        child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
          padding: const EdgeInsets.all(8.0),
          child: Text('None', style: textStyle),
        ),
      ));
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: cardChildren,
    );
  }
}
