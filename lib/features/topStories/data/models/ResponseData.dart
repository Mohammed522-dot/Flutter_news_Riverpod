import 'package:flutter_assessment/features/topStories/data/models/results.dart';

class ResponseData {
  String status;
  String copyright;
  String section;
  // DateTime lastUpdated;
  List<ResultsModel> results;
  ResponseData({
    required this.status,
    required this.copyright,
    required this.section,
    // required this.lastUpdated,
    required this.results,
  });
  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      status: json["status"],
      copyright: json["copyright"],
      section: json["section"],
      // lastUpdated: json["lastUpdated"],
      results: List<ResultsModel>.from(json["results"].map((x) => ResultsModel.fromJson(x))),

    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> results = new Map<String, dynamic>();
    results['results'] = this.results;
    return results;
  }
}