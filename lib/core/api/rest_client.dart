import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../constants.dart';

import '../models/business.dart';
import '../models/sub_category.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(Constants.restaurantsUrl)
  Future<List<BusinessRestModel>> getRestaurants();

  @GET(Constants.categoriesUrl)
  Future<List<CategoryRestModel>> getCategories();
}
