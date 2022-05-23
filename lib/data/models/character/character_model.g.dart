// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) =>
                  CharacterContentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      info: json['info'] == null
          ? const InfoModel()
          : InfoModel.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };

CharacterContentModel _$CharacterContentModelFromJson(
        Map<String, dynamic> json) =>
    CharacterContentModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      status: json['status'] as String? ?? '',
      species: json['species'] as String? ?? '',
      type: json['type'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      origin: json['origin'] == null
          ? const InfoModelOrigin()
          : InfoModelOrigin.fromJson(json['origin'] as Map<String, dynamic>),
      location: json['location'] == null
          ? const InfoModelLocation()
          : InfoModelLocation.fromJson(
              json['location'] as Map<String, dynamic>),
      image: json['image'] as String? ?? '',
      episode: (json['episode'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      url: json['url'] as String? ?? '',
      created: json['created'] as String? ?? '',
    );

Map<String, dynamic> _$CharacterContentModelToJson(
        CharacterContentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'satus': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'episode': instance.episode,
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

InfoModelOrigin _$InfoModelOriginFromJson(Map<String, dynamic> json) =>
    InfoModelOrigin(
      name: json['name'] as String? ?? '',
      url: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$InfoModelOriginToJson(InfoModelOrigin instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

InfoModelLocation _$InfoModelLocationFromJson(Map<String, dynamic> json) =>
    InfoModelLocation(
      name: json['name'] as String? ?? '',
      url: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$InfoModelLocationToJson(InfoModelLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
