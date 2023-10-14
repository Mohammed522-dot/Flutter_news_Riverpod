import 'package:equatable/equatable.dart';
import 'package:flutter_assessment/features/topStories/data/models/results.dart';
import 'package:flutter_assessment/features/topStories/domain/entities/results.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// part 'news_state.freezed.dart';

enum NewsConcreteState {
  initial,
  loading,
  loaded,
  failure,
  fetchedAllNews
}

class NewsState extends Equatable {
  final List<ResultsEntity> newsList;
  final bool hasData;
  final NewsConcreteState state;
  final String message;
  final bool isLoading;
  const NewsState({
    this.newsList = const [],
    this.isLoading = false,
    this.hasData = false,
    this.state = NewsConcreteState.initial,
    this.message = '',
  });
  const NewsState.initial({
    this.newsList = const [],
    this.isLoading = false,
    this.hasData = false,
    this.state = NewsConcreteState.initial,
    this.message = '',
  });

  NewsState copyWith({
    List<ResultsModel>? newsList,
    bool? hasData,
    NewsConcreteState? state,
    String? message,
    bool? isLoading,
  }) {
    return NewsState(
      isLoading: isLoading ?? this.isLoading,
      newsList: newsList ?? this.newsList,
      hasData: hasData ?? this.hasData,
      state: state ?? this.state,
      message: message ?? this.message,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [newsList, hasData, state, message];
}
