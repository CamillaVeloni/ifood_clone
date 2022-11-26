import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

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
}