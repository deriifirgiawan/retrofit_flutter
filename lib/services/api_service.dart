import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit_flutter/constant/api_path.dart';
import 'package:retrofit_flutter/core/models/response_model.dart';
import 'package:retrofit_flutter/models/article_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(pathTopHeadlines)
  Future<ResponseModel<List<ArticleModel>>> getTopHeadlinesService(
      @Query("apiKey") String apiKey, @Query("country") String country);
}
