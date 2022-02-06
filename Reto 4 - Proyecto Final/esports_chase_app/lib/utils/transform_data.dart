import 'dart:convert';
import 'package:esports_chase_app/models/new_model.dart';
import 'package:esports_chase_app/models/tournament_model.dart';
import 'package:esports_chase_app/models/next_match_model.dart';
import 'package:esports_chase_app/models/live_match_model.dart';

List<NewModel> transformDataNews(String? raw) {
  List<NewModel> newsData = [];
  if (raw != null) {
    final newsDataJson = jsonDecode(raw);
    for (var i = 0; i < newsDataJson.length; i++) {
      List<String> tags = [];
      for (int j = 0; j < newsDataJson[i]["tags"].length; j++) {
        tags.add(newsDataJson[i]["tags"][j]);
      }
      newsData.add(NewModel(
        newsDataJson[i]["id"],
        newsDataJson[i]["title"],
        newsDataJson[i]["image"],
        newsDataJson[i]["description"],
        newsDataJson[i]["article"],
        newsDataJson[i]["author"],
        newsDataJson[i]["info_author"],
        tags,
      ));
    }
  }
  return newsData;
}

List<TournamentModel> transformDataTournaments(String? raw) {
  List<TournamentModel> tournamentsData = [];
  if (raw != null) {
    final tournamentsDataJson = jsonDecode(raw);

    for (var i = 0; i < tournamentsDataJson.length; i++) {
      List<String> teams = [];
      List<String> teams_icons = [];

      for (int j = 0; j < tournamentsDataJson[i]["teams"].length; j++) {
        teams.add(tournamentsDataJson[i]["teams"][j]);
        teams_icons.add(tournamentsDataJson[i]["teams_icons"][j]);
      }
      tournamentsData.add(
        TournamentModel(
            tournamentsDataJson[i]["id"],
            tournamentsDataJson[i]["type"],
            tournamentsDataJson[i]["name"],
            tournamentsDataJson[i]["image"],
            tournamentsDataJson[i]["icon"],
            tournamentsDataJson[i]["region"],
            tournamentsDataJson[i]["esport"],
            tournamentsDataJson[i]["description"],
            tournamentsDataJson[i]["state"],
            teams,
            teams_icons),
      );
    }
  }
  return tournamentsData;
}

List<NextMatchModel> transformDataNextMatch(String? raw) {
  List<NextMatchModel> nextMatchsData = [];

  if (raw != null) {
    final nextMatchsDataJson = jsonDecode(raw);
    for (var i = 0; i < nextMatchsDataJson.length; i++) {
      nextMatchsData.add(NextMatchModel(
          nextMatchsDataJson[i]["id"],
          nextMatchsDataJson[i]["tournament"],
          nextMatchsDataJson[i]["esport"],
          nextMatchsDataJson[i]["date"],
          nextMatchsDataJson[i]["team_1"],
          nextMatchsDataJson[i]["team_1_icon"],
          nextMatchsDataJson[i]["team_2"],
          nextMatchsDataJson[i]["team_2_icon"]));
    }
  }

  return nextMatchsData;
}

List<LiveMatchModel> transformDataLiveMatch(String? raw) {
  List<LiveMatchModel> liveMatchsData = [];
  if (raw != null) {
    final liveMatchsDataJson = jsonDecode(raw);

    for (var i = 0; i < liveMatchsDataJson.length; i++) {
      List<String> stats_name = [];
      List<String> stats_team_1 = [];
      List<String> stats_team_2 = [];

      for (int j = 0; j < liveMatchsDataJson[i]["stats_name"].length; j++) {
        stats_name.add(liveMatchsDataJson[i]["stats_name"][j]);
        stats_team_1.add(liveMatchsDataJson[i]["stats_team_1"][j]);
        stats_team_2.add(liveMatchsDataJson[i]["stats_team_2"][j]);
      }
      liveMatchsData.add(LiveMatchModel(
          liveMatchsDataJson[i]["id"],
          liveMatchsDataJson[i]["tournament"],
          liveMatchsDataJson[i]["esport"],
          liveMatchsDataJson[i]["time"],
          liveMatchsDataJson[i]["team_1"],
          liveMatchsDataJson[i]["team_1_icon"],
          liveMatchsDataJson[i]["team_2"],
          liveMatchsDataJson[i]["team_2_icon"],
          stats_name,
          stats_team_1,
          stats_team_2));
    }
  }
  return liveMatchsData;
}
