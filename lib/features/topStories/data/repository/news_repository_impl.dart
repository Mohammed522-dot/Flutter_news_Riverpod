import 'dart:core';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_assessment/core/constant/constant.dart';
import 'package:flutter_assessment/core/resources/data_state.dart';
import 'package:flutter_assessment/features/topStories/data/dataource/remote/api_service.dart';
import 'package:flutter_assessment/features/topStories/data/models/results.dart';
import 'package:flutter_assessment/features/topStories/domain/entities/results.dart';
import 'package:flutter_assessment/features/topStories/domain/repository/news_repository.dart';
import 'package:dio/dio.dart';

class NewsRepositoryImpl implements NewsRepository{
  final ApiService _apiService;
  NewsRepositoryImpl(this._apiService);
  @override
  Future<DataState<List<ResultsModel>>> getAllNews() async {
    // try {
    final httpResponse = await _apiService.getAllNews(apikey: apiNewsKey);
    // if (httpResponse.response.statusCode == HttpStatus.ok) {
    print(httpResponse.response.data);
    return httpResponse.response.data;

    // }
    // else {
    //   return DataFailed(DioException(
    //       error: httpResponse.response.statusMessage,
    //       response: httpResponse.response,
    //       type: DioExceptionType.badResponse,
    //       requestOptions: httpResponse.response.requestOptions
    //   )
    //   );
    // }
    // } on DioException catch(e) {
    //   return DataFailed(e);
  }


  @override
  Future<DataState<List<ResultsEntity>>> sectionNews({required String query}) {
    // TODO: implement sectionNews
    throw UnimplementedError();
  }
}