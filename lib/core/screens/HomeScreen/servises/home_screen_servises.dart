
import 'package:news_api/core/AppConstans/AppConstans.dart';
import 'package:news_api/core/Networking/ApiEndpoints.dart';
import 'package:news_api/core/Networking/dio_heber.dart';
import 'package:news_api/core/screens/HomeScreen/models/top_headline_models.dart';

class HomeScreenServises {
  getToplineArtcels() async {
    try {
      final response = await DioHeber.gitReqost(
        endpont: ApiEndpoints.searchEndPont,
        query: {"apiKey": Appconstans.NewsApiKye, "country": "us"},
      );
      if (response.statusCode == 200) {
        TopHeadlineModels topHeadlineModels = TopHeadlineModels.fromJson(
          response.data,
        );
        print(topHeadlineModels.totalResults.toString());
        return topHeadlineModels;
      }
    } catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }
}
