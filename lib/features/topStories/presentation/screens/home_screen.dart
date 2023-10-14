
import 'package:flutter/material.dart';
import 'package:flutter_assessment/features/TopStories/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_assessment/features/TopStories/presentation/widgets/news_card.dart';
import 'package:flutter_assessment/features/topStories/presentation/providers/news_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final news = ref.watch(newsNotifierProvider.notifier);
    // news = ref.watch(newsProvider).newsModel;
    bool isLoading = ref.watch(newsNotifierProvider).isLoading;

    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),
      appBar: AppBar(
    title: const Center(child:CustomAppBar()),
    actions: [
      Row( children:[
    IconButton(
    onPressed: () => {},
    icon: const Icon(Icons.filter_list_sharp)),

    ],
      )
      ]
    ),
      body: SafeArea(
           child: Column(
              children: [

                isLoading ?
                SizedBox(
                  height: MediaQuery.of(context).size.height /2,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
                    : Expanded(
                  child: ListView.builder(
                    itemCount: news.state.newsList!.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsCard(resultsEntity: news.state.newsList[index],);
                    },
                  ),
                )
              ]
          )
      ),
    );
  }
}