
import 'package:flutter/material.dart';
import 'package:flutter_assessment/features/topStories/data/models/results.dart';
import 'package:flutter_assessment/features/topStories/presentation/providers/news_state.dart';
import 'package:flutter_assessment/features/topStories/presentation/providers/news_state_provider.dart';
import 'package:flutter_assessment/features/topStories/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_assessment/features/topStories/presentation/widgets/news_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final myProvider = StateProvider((ref) => newsNotifierProvider.notifier);
  Widget build(BuildContext context) {
    final news = ref.watch(newsNotifierProvider.notifier);
    bool isLoading = ref.watch(newsNotifierProvider).isLoading;
    final data = news.state.newsList;
    String? section;
    bool isSectionSelected = false;
    List<ResultsModel> _sections= news.state.newsList;
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),

      body: SafeArea(
           child: Column(
              children: [
                // Row( children:[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    const Expanded(
                        child: CustomAppBar()),
        Expanded(child: DropdownButton<String>(icon: const Icon(Icons.filter_list),
            underline: SizedBox(),
                isDense: true,
              isExpanded: true,
             items: _sections.map((sec){
             return DropdownMenuItem<String>(
            value: sec.section,
                 child: Text(sec.section));}).toList(),
             value: section,
             onChanged: (value){
              setState(() {
              section = value!;
             for(int i =0; i<_sections.length; i++){
            if(_sections[i].section == value) {
             section  = _sections[i].section;
            }
             }
              _sections.clear();

              ref.read(newsNotifierProvider.notifier).fetchNewsSection(section!);
           isSectionSelected = true;

    });})),

                    IconButton(
                        onPressed: () => {},
                        icon: const Icon(Icons.list)),
                    IconButton(
                        onPressed: () => {},
                        icon: const Icon(Icons.grid_view_outlined)),
      ]
                ),

                // ]
                // ),
                isLoading ?
                SizedBox(
                  height: MediaQuery.of(context).size.height /2,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
                    : Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsCard(resultsEntity: news.state.newsList[index],
                      );
                    },
                  ),
                )
              ]
          )
      ),
    );
  }
}