import 'package:flutter/material.dart';
import 'package:esports_chase_app/pages/home_page.dart';

Map<String, WidgetBuilder> getRApplicationRoutes(){
  return <String, WidgetBuilder> {
    "/": (BuildContext context) => HomePage()
  };
}