// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_stories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopStories _$TopStoriesFromJson(Map<String, dynamic> json) => TopStories(
      section: json['section'] as String,
      subsection: json['subsection'] as String,
      title: json['title'] as String,
      resultAbstract: json['resultAbstract'] as String,
      url: json['url'] as String,
      uri: json['uri'] as String,
      byline: json['byline'] as String,
      updatedDate: DateTime.parse(json['updatedDate'] as String),
      createdDate: DateTime.parse(json['createdDate'] as String),
      publishedDate: DateTime.parse(json['publishedDate'] as String),
      materialTypeFacet: json['materialTypeFacet'] as String,
      kicker: json['kicker'] as String,
      desFacet:
          (json['desFacet'] as List<dynamic>).map((e) => e as String).toList(),
      orgFacet:
          (json['orgFacet'] as List<dynamic>).map((e) => e as String).toList(),
      perFacet:
          (json['perFacet'] as List<dynamic>).map((e) => e as String).toList(),
      geoFacet:
          (json['geoFacet'] as List<dynamic>).map((e) => e as String).toList(),
      multimedia: (json['multimedia'] as List<dynamic>)
          .map((e) => Multimedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      shortUrl: json['shortUrl'] as String,
    );

Map<String, dynamic> _$TopStoriesToJson(TopStories instance) =>
    <String, dynamic>{
      'section': instance.section,
      'subsection': instance.subsection,
      'title': instance.title,
      'resultAbstract': instance.resultAbstract,
      'url': instance.url,
      'uri': instance.uri,
      'byline': instance.byline,
      'updatedDate': instance.updatedDate.toIso8601String(),
      'createdDate': instance.createdDate.toIso8601String(),
      'publishedDate': instance.publishedDate.toIso8601String(),
      'materialTypeFacet': instance.materialTypeFacet,
      'kicker': instance.kicker,
      'desFacet': instance.desFacet,
      'orgFacet': instance.orgFacet,
      'perFacet': instance.perFacet,
      'geoFacet': instance.geoFacet,
      'multimedia': instance.multimedia,
      'shortUrl': instance.shortUrl,
    };
