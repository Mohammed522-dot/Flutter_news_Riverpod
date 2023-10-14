import 'package:flutter_assessment/features/topStories/data/dataource/remote/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

final networkServiceProvider = Provider<ApiService>(
      (ref) {
    final Dio dio = Dio();
    return ApiService(dio);
  },
);