import 'package:flutter/foundation.dart';

class DrawerModel extends ChangeNotifier {
  var _selected = "Feed";

  String get selected => _selected;

  set selected(String selected) {
    _selected = selected;
    notifyListeners();
  }
}
