// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) => EpisodeModel(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) =>
                  EpisodeContentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      info: json['info'] == null
          ? const InfoModel()
          : InfoModel.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EpisodeModelToJson(EpisodeModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };

EpisodeContentModel _$EpisodeContentModelFromJson(Map<String, dynamic> json) =>
    EpisodeContentModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      air_date: json['air_date'] as String? ?? '',
      episode: json['episode'] as String? ?? '',
      characters: (json['characters'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      url: json['url'] as String? ?? '',
      created: json['created'] as String? ?? '',
    );

Map<String, dynamic> _$EpisodeContentModelToJson(
        EpisodeContentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'air_date': instance.air_date,
      'episode': instance.episode,
      'characters': instance.characters,
      'url': instance.url,
      'created': instance.created,
    };

InfoModel _$InfoModelFromJson(Map<String, dynamic> json) => InfoModel(
      count: json['count'] as int? ?? 0,
      pages: json['pages'] as int? ?? 0,
      next: json['next'] as String? ?? '',
      prev: json['prev'] as String? ?? '',
    );

Map<String, dynamic> _$InfoModelToJson(InfoModel instance) => <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };
