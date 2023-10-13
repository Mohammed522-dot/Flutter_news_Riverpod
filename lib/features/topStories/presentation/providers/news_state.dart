import 'package:flutter_assessment/features/topStories/data/models/results.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'news_state.freezed.dart';


@freezed
class NewsState  with _$NewsState {
  const factory NewsState({
    @Default(true) bool isLaoding,
    required ResultsModel resultsModel,
}) = _NewsState;
  const NewsState._();
}