import 'package:http/http.dart';

class EsportsChaseHttpService {
  final String baseURL =
      "https://y6pp2ci5c1.execute-api.us-east-2.amazonaws.com/dev";

  Future<String> getRawNews(String queryParams) async {
    String fullURL = '$baseURL/news$queryParams';
    Response res = await get(Uri.parse(fullURL));

    if (res.statusCode == 200) {
      return res.body;
    } else {
      throw "Unable to retrieve news.";
    }
  }

  Future<String> getRawTournaments(String queryParams) async {
    String fullURL = '$baseURL/tournaments$queryParams';
    Response res = await get(Uri.parse(fullURL));
    if (res.statusCode == 200) {
      return res.body;
    } else {
      throw "Unable to retrieve news.";
    }
  }

  Future<String> getRawNextMatchs(String queryParams) async {
    String fullURL = '$baseURL/matchs/nexts$queryParams';
    Response res = await get(Uri.parse(fullURL));
    if (res.statusCode == 200) {
      return res.body;
    } else {
      throw "Unable to retrieve news.";
    }
  }

  Future<String> getRawLiveMatchs(String queryParams) async {
    String fullURL = '$baseURL/matchs/live$queryParams';
    Response res = await get(Uri.parse(fullURL));
    if (res.statusCode == 200) {
      return res.body;
    } else {
      throw "Unable to retrieve news.";
    }
  }
}
