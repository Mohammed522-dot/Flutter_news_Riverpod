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
  section,
  fetchedAllNews
}

class NewsState extends Equatable {
  final List<ResultsModel> newsList;
  final bool hasData;
  final NewsConcreteState state;
  final String message;
  final String section;
  final bool isLoading;
  const NewsState({
     this.newsList= const [],
    this.isLoading = false,
     required this.section,
    this.hasData = false,
    this.state = NewsConcreteState.initial,
    this.message = '',
  });
  const NewsState.initial({
    this.newsList = const [],
    this.isLoading = false,
     this.section = '',
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
      section: section ?? this.section ,
    );
  }
  @override
  String toString() {
    return 'NewsState(isLoading:$isLoading, newsLength: ${newsList.length}, hasData: $hasData, state: $state, message: $message)';
  }
  @override
  // TODO: implement props
  List<Object?> get props => [newsList, hasData, state, message];
}
