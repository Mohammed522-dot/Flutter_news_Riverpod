import 'package:dartz/dartz.dart';
import 'package:flutter_assessment/core/constant/constant.dart';
import 'package:flutter_assessment/core/resources/data_state.dart';
import 'package:flutter_assessment/features/topStories/data/dataource/remote/api_service.dart';
import 'package:flutter_assessment/features/topStories/data/models/results.dart';
import 'package:flutter_assessment/features/topStories/domain/entities/results.dart';
import 'package:flutter_assessment/features/topStories/domain/repository/news_repository.dart';
import 'package:flutter_assessment/features/topStories/presentation/providers/news_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

      final response = await newsRepository.getAllNews();
      updateStateFromResponse(response);
      // print(response.data);
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
      response.error?.response?.data.fold((failure) {
      state = state.copyWith(
        state : NewsConcreteState.failure,
        message: failure.error?.message,
        isLoading: false,
      );
    }, (data) {
      final newsList = data.map((e) => ResultsModel.fromJson(e as Map<String, dynamic>)).toList();
        state = state.copyWith(
        newsList: newsList,
        state: NewsConcreteState.loaded,
        hasData: true,
        message: newsList.isEmpty ? 'No products found' : '',
        isLoading: false,
      );
    });
  }

  void resetState() {
    state = const NewsState.initial();
  }


}
