import 'package:flutter_assessment/model/top_stories.dart';
import 'package:flutter_assessment/service/api_service.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
class TopStoriesController extends GetxController {
  var isLoading = true.obs;
  var topStoriesList = <TopStories>[].obs;

  @override
  void onInit(){
    fetchTopStories();
    super.onInit();
  }
  void fetchTopStories() async {
    try {
      isLoading(true);
      final apiService = ApiService(Dio(BaseOptions(contentType: "application/json")));
      var topStories = await apiService.getAllTopStories();
      if(topStories.isNotEmpty) {

       topStoriesList.value = topStories;
      }
      print(topStories);
    } finally{}
  }
}