import 'package:dartz/dartz.dart';
import 'package:flutter_assessment/core/constant/constant.dart';
import 'package:flutter_assessment/core/resources/data_state.dart';
import 'package:flutter_assessment/features/topStories/data/dataource/remote/api_service.dart';
import 'package:flutter_assessment/features/topStories/data/models/results.dart';
import 'package:flutter_assessment/features/topStories/domain/entities/results.dart';
import 'package:flutter_assessment/features/topStories/domain/repository/news_repository.dart';
import 'package:flutter_assessment/features/topStories/presentation/providers/news_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/dio.dart';

class NewsNotifier extends StateNotifier<NewsState> {
  final NewsRepository newsRepository;
  NewsNotifier(
      this.newsRepository,
      ) : super(const NewsState.initial());

  Future<void> fetchNews() async {
    if (state.state != NewsConcreteState.fetchedAllNews) {
      state = state.copyWith(
        state: NewsConcreteState.loading,
        isLoading: true,
      );

      final response = await newsRepository.sectionNews();
      updateStateFromResponse(response);
    } else {
      state = state.copyWith(
        state: NewsConcreteState.fetchedAllNews,
        message: 'No more products available',
        isLoading: false,
      );
    }
  }
  Future<void> fetchNewsSection(String section) async {
    if (state.state != NewsConcreteState.fetchedAllNews) {
      state = state.copyWith(
        state: NewsConcreteState.loading,
        isLoading: true,
      );

      final response = await newsRepository.getAllNews(section: section);
      updateStateFromResponse(response);
    } else {
      state = state.copyWith(
        state: NewsConcreteState.fetchedAllNews,
        message: 'No more products available',
        isLoading: false,
      );
    }
  }
  void updateStateFromResponse(
      DataState<List<ResultsModel>>  response) {
      if(response.data == response.error) {
      state = state.copyWith(
        state : NewsConcreteState.failure,
        message: response.error?.message,
        isLoading: false,
      );
    }else {
        state = state.copyWith(
        newsList: response.data,
        state: NewsConcreteState.loaded,
        hasData: true,
        message: state.newsList.isEmpty ? 'No products found' : '',
        isLoading: false,
      );
      }
  }

  void resetState() {
    state = const NewsState.initial();
  }


}
