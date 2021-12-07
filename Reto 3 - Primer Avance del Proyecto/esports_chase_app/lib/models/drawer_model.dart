import 'package:flutter/foundation.dart';

class DrawerModel extends ChangeNotifier {
  var _selected = "Feed";

  //AQUI SE HACE LA LÓGICA PARA EL CAMBIO DE CONTENIDOS DE ACUERDO CON LA
  //SECCIÓN O LA PESTAÑA (Solo si se cambia a la sección )

  String get selected => _selected;

  set selected(String selected) {
    _selected = selected;
    notifyListeners();
  }
}
