import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  "add_alert": Icons.add_alert,
  "accessibility": Icons.accessibility,
  "feed": Icons.list
};

Icon getIcon(String nombreIcono) {
  return Icon(_icons[nombreIcono]);
}
