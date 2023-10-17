
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_assessment/core/resources/data_state.dart';
import 'package:flutter_assessment/features/topStories/data/models/results.dart';
import 'package:flutter_assessment/features/topStories/data/repository/news_repository_impl.dart';
import 'package:flutter_assessment/features/topStories/domain/entities/results.dart';
import 'package:flutter_assessment/features/topStories/presentation/providers/news_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class NewsRepository {
  Future<DataState<List<ResultsModel>>> getAllNews({required String section});
  Future<DataState<List<ResultsModel>>> sectionNews();
}