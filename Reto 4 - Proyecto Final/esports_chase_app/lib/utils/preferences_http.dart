import 'package:esports_chase_app/shared_prefs/favourite_prefs.dart';

String getQuery() {
  // All games
  FavouritePreferences favourites = FavouritePreferences();
  List<String> allGames = [
    "Dota 2",
    "Fortnite",
    "League of Legends",
    "Overwatch",
    "Street Fighter V",
    "Valorant"
  ];

  // Favorite games
  List<String> favouritesGames = [];
  for (int i = 0; i < allGames.length; i++) {
    if (favourites.getFavourite(allGames[i])) {
      favouritesGames.add(allGames[i]);
    }
  }

  // Create Query
  String query = "";
  if (favouritesGames.isNotEmpty) {
    query = "?esport=${favouritesGames[0]}";
  }
  for (int i = 1; i < favouritesGames.length; i++) {
    query = "$query&esport=${favouritesGames[i]}";
  }
  return query;
}
