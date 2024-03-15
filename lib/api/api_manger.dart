import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_final/model/NewsResponse.dart';

import '../model/SourceResponse.dart';
import 'api_const.dart';

class ApiManger {
  /*
 https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY

e95cd10d78a34503b157d2ba843dd535
*/

  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(
      ApiConst.baseUrl,
      ApiConst.sourcesApi,
      {
        "apiKey": "8127c264b4d64821900aa79b6826db4e",
        "category": categoryId,
      },
    );

    try {
      var response = await http.get(url);
      var responseString = response.body; //string
      var json = jsonDecode(responseString); //json

      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getNewsResponse(String sourceId,
      {String? query, int pageSize = 5, int page = 1}) async {
    Uri url = Uri.https(ApiConst.baseUrl, ApiConst.newsApi, {
      "apiKey": "8127c264b4d64821900aa79b6826db4e",
      "sources": sourceId,
      "q": query,
      "pageSize": pageSize.toString(),
      "page": page.toString()
    });
    try {
      var response = await http.get(url);
      var responseString = response.body; //String
      var json = jsonDecode(responseString); //json
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
