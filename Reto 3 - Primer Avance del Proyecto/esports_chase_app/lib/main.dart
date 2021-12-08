import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:esports_chase_app/models/drawer_model.dart';
import 'package:esports_chase_app/screens/about_screen.dart';
import 'package:esports_chase_app/screens/config_screen.dart';

import 'package:esports_chase_app/screens/feed_screen.dart';
import 'package:esports_chase_app/screens/league_screen.dart';
import 'package:esports_chase_app/screens/valorant_screen.dart';
import 'package:esports_chase_app/shared_prefs/favourite_prefs.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = FavouritePreferences();
  await prefs.initPrefs();

  runApp(ChangeNotifierProvider(
    create: (context) => DrawerModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const brightness = Brightness.dark;
    const primaryColor = Color.fromRGBO(17, 24, 33, 1);
    const canvasColor = Color.fromRGBO(17, 24, 33, 1);
    const cardColor = Color.fromRGBO(38, 45, 54, 1);
    const splashColor = Color.fromRGBO(38, 45, 54, 1);
    const dividerColor = Color.fromRGBO(42, 61, 84, 1);
    const textFieldFocusColor = Colors.lightBlue;

    // Builder

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        theme: ThemeData(
            brightness: brightness,
            primaryColor: primaryColor,
            canvasColor: canvasColor,
            cardColor: cardColor,
            splashColor: splashColor,
            dividerColor: dividerColor,
            primarySwatch: textFieldFocusColor,
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: textFieldFocusColor,
              selectionColor: Colors.red,
            )),
        debugShowCheckedModeBanner: false,
        initialRoute: 'Feed',
        routes: getApplicationRoutes(),
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (BuildContext context) => const FeedScreen());
        },
      ),
    );
  }

  Map<String, WidgetBuilder> getApplicationRoutes() {
    return <String, WidgetBuilder>{
      "Feed": (BuildContext context) => const FeedScreen(),
      "League of Legends": (BuildContext context) => const LeagueScreen(),
      "Valorant": (BuildContext context) => const ValorantScreen(),
      "Preferences": (BuildContext context) => const ConfigScreen(),
      "About Us": (BuildContext context) => const AboutScreen()
    };
  }
}
