// class Infos {
//   String title;
//   String description;
//   Infos() {
//     title = "mon titre";
//     description = "ma description";
//   }
// }

import 'package:flutter/foundation.dart';

class Infos with ChangeNotifier {
  String _title;
  String _description;

  Infos() {
    _title = "default title";
    _description = "default description";
  }

  String get title => _title;
  String get description => _description;

  setTitle(String value) {
    _title = value;
    notifyListeners();
  }

  setDescription(String value) {
    _description = value;
    notifyListeners();
  }
}
