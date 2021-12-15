import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _DrawerProvider {
  List<dynamic> drawerOptions = [];

  _DrawerProvider();

  Future<List<dynamic>> cargarData() async {
    if (drawerOptions.isNotEmpty) return drawerOptions;
    final resp = await rootBundle.loadString('static/data/drawer_config.json');

    Map dataMap = json.decode(resp);
    drawerOptions = dataMap["drawer"];

    return drawerOptions;
  }
}

final drawerProvider = _DrawerProvider();
