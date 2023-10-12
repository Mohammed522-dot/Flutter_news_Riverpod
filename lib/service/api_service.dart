import 'package:flutter_assessment/model/top_stories.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: 'https://api.nytimes.com/svc/topstories/v2/')
 abstract class ApiService {
 static const apikey = 'api-key=GSOuVWVE6F2AbM8Gsq7rBpGR4V2NTcde';

 static const topStories = '/svc/topstories/v2/arts.json?$apikey';

  factory ApiService(Dio dio) = _ApiService;

  @GET('arts.json?api-key=GSOuVWVE6F2AbM8Gsq7rBpGR4V2NTcde')
  Future<List<TopStories>> getAllTopStories();
}