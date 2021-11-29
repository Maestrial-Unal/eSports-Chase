import 'package:flutter/material.dart';

import 'package:esports_chase_app/pages/home_page.dart';
import 'package:esports_chase_app/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components App',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: getRApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context) => HomePage()
        );
      },
    );
  }
}