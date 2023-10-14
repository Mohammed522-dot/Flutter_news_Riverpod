import 'package:dartz/dartz.dart';
import 'package:flutter_assessment/core/resources/data_state.dart';
import 'package:flutter_assessment/core/usecase/usecase.dart';
import 'package:flutter_assessment/features/topStories/data/models/results.dart';
import 'package:flutter_assessment/features/topStories/domain/entities/results.dart';
import 'package:flutter_assessment/features/topStories/domain/repository/news_repository.dart';

class GetNewsUseCase  implements UseCase<DataState<List<ResultsEntity>>,void> {

  final NewsRepository _newsRepository;
  GetNewsUseCase(this._newsRepository);
  @override
  Future<DataState<List<ResultsEntity>>> call({void params}) {
  return _newsRepository.getAllNews();
  }
}