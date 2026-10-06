import 'package:dio/dio.dart';
import 'package:news_api/core/Networking/ApiEndpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHeber {
  static Dio? dio;
  static initdio() {
    dio ??= Dio(BaseOptions(baseUrl: ApiEndpoints.buseurl));
    dio!.interceptors.add(PrettyDioLogger());
  }

  static gitReqost({
    required String endpont,
    required Map<String, dynamic> query,
  }) async {
    try {
      Response response = await dio!.get(endpont, queryParameters: query);
      return response;
    } catch (e) {
      print(e.toString());
    }
  }
}
