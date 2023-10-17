import 'package:flutter/material.dart';
import 'package:flutter_assessment/features/topStories/data/models/results.dart';
import 'package:flutter_assessment/features/topStories/presentation/providers/news_state.dart';
import 'package:flutter_assessment/features/topStories/presentation/providers/news_state_provider.dart';
import 'package:flutter_assessment/features/topStories/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_assessment/features/topStories/presentation/widgets/news_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_assessment/features/topStories/presentation/widgets/news_card_grid.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final myProvider = StateProvider((ref) => newsNotifierProvider.notifier);
  var status =0;
  final List<ResultsModel> _allnews = [];
  List<ResultsModel> _foundNews = [];

  @override
  void initState() {
    _foundNews = _allnews;
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

    final news = ref.watch(newsNotifierProvider.notifier);
    final data = news.state.newsList;
    bool isLoading = ref.watch(newsNotifierProvider).isLoading;
    final _sections = news.state.newsList;
    String? section;
    bool isSectionSelected = false;
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),
      body: SafeArea(
          child: Column(children: [
        // Row( children:[
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: DropdownButton<String>(
                      icon: const Icon(Icons.filter_list),
                      underline: SizedBox(),
                      isDense: true,
                      isExpanded: true,
                      items: _sections.map((sec) {
                        return DropdownMenuItem<String>(
                            value: sec.section, child: Text(sec.section));
                      }).toList(),
                      value: section,
                      onChanged: (value) {
                        setState(() {
                          section = value;
                          for (int i = 0; i < _sections.length; i++) {
                            if (_sections[i].section == value) {
                              section = _sections[i].section;
                            }
                            _sections.clear();
                          }
                          ref.read(newsNotifierProvider.notifier).fetchNewsSection(section!);
                          isSectionSelected = true;
                        });
                      })),
              IconButton(onPressed: () => {
              setState(() {
              if (status == 0) {
                  status = 1;
                 } else {
                 status = 0;
                }
              })
              },icon: status == 0 ? Icon(Icons.list) : Icon(Icons.grid_view)),
              SizedBox(
                  width: 300,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: const Color(0xff1D1617).withOpacity(0.11),
                          blurRadius: 40,
                          spreadRadius: 0.0)
                    ]),
                    child: TextField(
                      onChanged: (value) => _runFilter(value),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.all(15),
                          hintText: 'Search News',
                          hintStyle:
                          const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none)),
                    ),
                  )),

            ]),

        isLoading
            ? SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Expanded(
                child:status == 0 ? ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return NewsCard(
                      resultsEntity: news.state.newsList[index],
                    );
                  },
                ) :GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (_, index) {
                      return NewsCardGrid(resultsEntity: news.state.newsList[index]);
                    }),
              ),
        _foundNews.isNotEmpty
            ? Expanded(
                child: status == 0 ?ListView.builder(
                  itemCount: _foundNews.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return NewsCard(
                      resultsEntity: _foundNews[index],
                    );
                  },
                ) : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2),
                itemBuilder: (_, index) {
                return NewsCardGrid(resultsEntity: _foundNews[index]);
                 }))
                : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
      ])),
    );
  }
}
