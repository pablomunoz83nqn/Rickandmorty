// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      sellerId: json['sellerId'] as String? ?? '',
      appVersion: json['appVersion'] as String? ?? '',
      osName: json['osName'] as String? ?? '',
      country: json['country'] as String? ?? '',
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'sellerId': instance.sellerId,
      'appVersion': instance.appVersion,
      'osName': instance.osName,
      'country': instance.country,
    };
