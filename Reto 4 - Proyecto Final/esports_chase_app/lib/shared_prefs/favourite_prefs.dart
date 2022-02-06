import 'package:shared_preferences/shared_preferences.dart';

class FavouritePreferences {
  static final FavouritePreferences _instance =
      FavouritePreferences._internal();

  factory FavouritePreferences() {
    return _instance;
  }

  FavouritePreferences._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // GET y SET de los juegos marcados como favoritos
  bool getFavourite(String name) {
    return _prefs.getBool(name) ?? false;
  }

  void setFavourite(String name, bool value) {
    _prefs.setBool(name, value);
  }
}
