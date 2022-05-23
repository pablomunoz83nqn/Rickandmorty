// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) =>
                  LocationContentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      info: json['info'] == null
          ? const InfoModel()
          : InfoModel.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };

LocationContentModel _$LocationContentModelFromJson(
        Map<String, dynamic> json) =>
    LocationContentModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      dimension: json['dimension'] as String? ?? '',
      residents: (json['residents'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      url: json['url'] as String? ?? '',
      created: json['created'] as String? ?? '',
    );

Map<String, dynamic> _$LocationContentModelToJson(
        LocationContentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'dimension': instance.dimension,
      'residents': instance.residents,
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
