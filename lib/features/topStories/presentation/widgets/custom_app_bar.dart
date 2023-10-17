import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_assessment/features/topStories/data/models/results.dart';
import 'package:flutter_assessment/features/topStories/domain/entities/results.dart';
import 'package:flutter_assessment/features/topStories/presentation/providers/news_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerStatefulWidget {

  const CustomAppBar({ Key? key,}) : super(key: key);
  @override
  ConsumerState<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends ConsumerState<CustomAppBar> {
  final myProvider = StateProvider((ref) => newsNotifierProvider.notifier);

  final List<ResultsModel> _allnews = [];
  List<ResultsModel> _foundNews = [];

  @override
  void initState() {

    _foundNews = _allnews;
    print(_allnews);
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    final _allnews = ref.watch(newsNotifierProvider.notifier);
    List<ResultsModel> results = _allnews.state.newsList;
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allnews.state.newsList;
    } else {
      results = _allnews.state.newsList
          .where((news) =>
          news.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    // Refresh the UI
    setState(() {
      _foundNews = results;
      print(_foundNews);
    });
  }
  @override
  Widget build(BuildContext context) {
    Debouncer _debouncer = Debouncer();
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: const Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0
            )
          ]
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: 'Search News',
            hintStyle: const TextStyle(
                color: Color(0xffDDDADA),
                fontSize: 14
            ),
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none
            )
        ),
      ),
    );
  }

}


class Debouncer {
  final int milliseconds;

  Timer? _timer;

  Debouncer({this.milliseconds=500});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}