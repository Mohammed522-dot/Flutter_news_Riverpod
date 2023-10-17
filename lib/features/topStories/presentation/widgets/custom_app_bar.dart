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

    List<ResultsModel> items =[];

  @override
  void initState() {

    super.initState();
  }
  void filterSearchResults(String query) {
    setState(() {
      final news = ref.watch(newsNotifierProvider.notifier);
       items  = news.state.newsList;
      items
          .where((item) =>
          item.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
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
        onChanged: (value) {
          _debouncer.run(() {
            // if (value.isNotEmpty) {
              filterSearchResults(value);
            // } else {
            //   ref
            //       .read(newsNotifierProvider.notifier)
            //       .state
            //       .newsList;
            // }
          });
        },
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