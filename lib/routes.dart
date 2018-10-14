import 'package:flutter/material.dart';
import 'package:tronald_dump/main_screen/MainScreenWidget.dart';
import 'package:tronald_dump/tag_screen/TagScreenWidget.dart';

class Routes {

  static Widget home() {
    return MainScreenWidget();
  }

  static Widget tag(String tag) {
    return TagScreenWidget(tag: tag);
  }

}
