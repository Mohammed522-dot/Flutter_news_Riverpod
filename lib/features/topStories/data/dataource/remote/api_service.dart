import 'package:flutter_assessment/core/constant/constant.dart';
import 'package:flutter_assessment/features/topStories/data/models/ResponseData.dart';
import 'package:flutter_assessment/features/topStories/data/models/results.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: newsBaseUrl)
 abstract class ApiService {

  factory ApiService(Dio dio) = _ApiService;
  @GET("{section}.json")
  Future<HttpResponse<List<ResultsModel>>> getAllNews({
   @Path("section") String section,
   @Query("api-key") String apikey});
}