import 'package:flutter_assessment/core/resources/network_service_provider.dart';
import 'package:flutter_assessment/features/topStories/data/dataource/remote/api_service.dart';
import 'package:flutter_assessment/features/topStories/data/repository/news_repository_impl.dart';
import 'package:flutter_assessment/features/topStories/domain/repository/news_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsDatasourceProvider =
Provider.family<ApiService, ApiService>(
      (_, networkService) => networkService,
);

  final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final ApiService networkService = ref.watch(networkServiceProvider);
  final datasource = ref.watch(newsDatasourceProvider(networkService));
  final repository = NewsRepositoryImpl(datasource);
  return repository;
});