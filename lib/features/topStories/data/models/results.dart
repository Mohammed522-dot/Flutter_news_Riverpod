import 'package:flutter_assessment/features/topStories/domain/entities/multimedia.dart';
import 'package:flutter_assessment/features/topStories/domain/entities/results.dart';
import 'package:json_annotation/json_annotation.dart';

class ResultsModel extends ResultsEntity {
   ResultsModel({
  required super.section,
    required super.subsection,
    required super.title,
    required super.resultAbstract,
    required super.url,
    required super.uri,
    required super.byline,
    required super.updatedDate,
    required super.createdDate,
     required super.publishedDate,
     required super.materialTypeFacet,
     // required super.kicker,
     // required super.desFacet,
     // required super.orgFacet,
     // required super.perFacet,
     // required super.geoFacet,
     required super.multimedia,
     required super.shortUrl});


  factory ResultsModel.fromJson(Map<String, dynamic> json) {
    return ResultsModel(
      section: json["section"],
      subsection: json["subsection"],
      title: json["title"],
      resultAbstract: json["abstract"],
      url: json["url"],
      uri: json["uri"],
      byline: json["byline"],
      updatedDate: DateTime.parse(json["updated_date"]),
      createdDate: DateTime.parse(json["created_date"]),
      publishedDate: DateTime.parse(json["published_date"]),
      materialTypeFacet: json["material_type_facet"],
      // kicker: json["kicker"],
      // desFacet: List<String>.from(json["des_facet"].map((x) => x)),
      // orgFacet: List<String>.from(json["org_facet"].map((x) => x)),
      // perFacet: List<String>.from(json["per_facet"].map((x) => x)),
      // geoFacet: List<String>.from(json["geo_facet"].map((x) => x)),
      multimedia: List<Multimedia>.from(
          json["multimedia"].map((x) => Multimedia.fromJson(x))),
      shortUrl: json["short_url"],
    );
  }
  Map<String, dynamic> toJson() => {
    "section": section,
    "subsection": subsection,
    "title": title,
    "abstract": resultAbstract,
    "url": url,
    "uri": uri,
    "byline": byline,
    "updated_date": updatedDate.toIso8601String(),
    "created_date": createdDate.toIso8601String(),
    "published_date": publishedDate.toIso8601String(),
    "material_type_facet": materialTypeFacet,
    // "kicker": kicker,
    // "des_facet": List<dynamic>.from(desFacet.map((x) => x)),
    // "org_facet": List<dynamic>.from(orgFacet.map((x) => x)),
    // "per_facet": List<dynamic>.from(perFacet.map((x) => x)),
    // "geo_facet": List<dynamic>.from(geoFacet.map((x) => x)),
    // "multimedia": List<dynamic>.from(multimedia.map((x) => x.toJson())),
    "short_url": shortUrl,
  };

   @override
   String toString() {
     return 'ResultsModel { section: $section, subsection: $subsection,title: $title, abstract: $resultAbstract }';
   }

}