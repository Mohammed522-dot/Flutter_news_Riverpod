import 'package:flutter_assessment/features/topStories/domain/providers/news_provider.dart';
import 'package:flutter_assessment/features/topStories/domain/repository/news_repository.dart';
import 'package:flutter_assessment/features/topStories/presentation/providers/news_notifier.dart';
import 'package:flutter_assessment/features/topStories/presentation/providers/news_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final  newsNotifierProvider = StateNotifierProvider<NewsNotifier, NewsState>((ref) {
  final  NewsRepository repository = ref.watch(newsRepositoryProvider);
  return NewsNotifier(repository)..fetchNews();
});