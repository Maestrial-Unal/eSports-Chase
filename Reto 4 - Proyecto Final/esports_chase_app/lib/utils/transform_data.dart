import 'dart:convert';
import 'package:esports_chase_app/models/new_model.dart';

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
