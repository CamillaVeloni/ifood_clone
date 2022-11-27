import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:ifood_clone/core/models/business.dart';

import 'rest_client.dart';

class ApiUtil {

  static Dio getHttpClient() {
    final dio = Dio();
    var adapter = dio.httpClientAdapter as DefaultHttpClientAdapter;

    adapter.onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };

    // dio.options.headers["Authorization"] = "Bearer $apiKey";

    return dio;
  }

  static Future<RestClient> getRestClient() async => RestClient(getHttpClient());

  static Future<List<BusinessRestModel>> getAllRestaurants() async {
    late List<BusinessRestModel> restaurants;
    try {
      final client = await getRestClient();
      restaurants = await client.getRestaurants();
    } catch(obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioError:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          print("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
          break;
        default:
          break;
      }
      restaurants = [];
    }

    return restaurants;
  }
}