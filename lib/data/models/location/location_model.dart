import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  final InfoModel? info;
  final List<LocationContentModel> results;

  const LocationModel({
    this.results = const [],
    this.info = const InfoModel(),
  });

  factory LocationModel.fromRawJson(String str) =>
      LocationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

@JsonSerializable()
class LocationContentModel {
  int id;
  String name;
  String type;
  String dimension;
  final List<String> residents;
  String url;
  String created;

  LocationContentModel({
    this.id = 0,
    this.name = '',
    this.type = '',
    this.dimension = '',
    this.residents = const [],
    this.url = '',
    this.created = '',
  });

  factory LocationContentModel.fromRawJson(String str) =>
      LocationContentModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationContentModel.fromJson(Map<String, dynamic> json) =>
      _$LocationContentModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationContentModelToJson(this);
}

@JsonSerializable()
class InfoModel {
  final int count;
  final int pages;
  final String next;
  final String prev;

  const InfoModel({
    this.count = 0,
    this.pages = 0,
    this.next = '',
    this.prev = '',
  });

  factory InfoModel.fromRawJson(String str) =>
      InfoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoModelToJson(this);
}
