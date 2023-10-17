import 'package:flutter_assessment/features/topStories/domain/entities/multimedia.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ResultsEntity {
  String section;
  String subsection;
  String title;
  String resultAbstract;
  String url;
  String uri;
  String byline;
  DateTime updatedDate;
  DateTime createdDate;
  DateTime publishedDate;
  String materialTypeFacet;
  // String kicker;
  // List<String> desFacet;
  // List<String> orgFacet;
  // List<String> perFacet;
  // List<String> geoFacet;
  List<Multimedia> multimedia;
  String shortUrl;

  ResultsEntity({
    required this.section,
    required this.subsection,
    required this.title,
    required this.resultAbstract,
    required this.url,
    required this.uri,
    required this.byline,
    required this.updatedDate,
    required this.createdDate,
    required this.publishedDate,
    required this.materialTypeFacet,
    // required this.kicker,
    // required this.desFacet,
    // required this.orgFacet,
    // required this.perFacet,
    // required this.geoFacet,
    required this.multimedia,
    required this.shortUrl,
  });

  factory ResultsEntity.fromJson(Map<String, dynamic> json) => ResultsEntity(
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
    multimedia: List<Multimedia>.from(json["multimedia"].map((x) => Multimedia.fromJson(x))),
    shortUrl: json["short_url"],
  );

  // Map<String, dynamic> toJson() => {
  //   "section": section,
  //   "subsection": subsection,
  //   "title": title,
  //   "abstract": resultAbstract,
  //   "url": url,
  //   "uri": uri,
  //   "byline": byline,
  //   "updated_date": updatedDate.toIso8601String(),
  //   "created_date": createdDate.toIso8601String(),
  //   "published_date": publishedDate.toIso8601String(),
  //   "material_type_facet": materialTypeFacet,
  //   // "kicker": kicker,
  //   // "des_facet": List<dynamic>.from(desFacet.map((x) => x)),
  //   // "org_facet": List<dynamic>.from(orgFacet.map((x) => x)),
  //   // "per_facet": List<dynamic>.from(perFacet.map((x) => x)),
  //   // "geo_facet": List<dynamic>.from(geoFacet.map((x) => x)),
  //   "multimedia": List<dynamic>.from(multimedia.map((x) => x.toJson())),
  //   "short_url": shortUrl,
  // };

@override
  List <Object ?> get props {
  return [
    section,
   subsection,
    title,
   resultAbstract,
   url,
    uri,
    byline,
    updatedDate,
   createdDate,
    publishedDate,
    materialTypeFacet,
    // required this.kicker,
    // required this.desFacet,
    // required this.orgFacet,
    // required this.perFacet,
    // required this.geoFacet,
    multimedia,
    shortUrl,

  ];
}
}