import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  final InfoModel? info;
  final List<CharacterContentModel> results;

  const CharacterModel({
    this.results = const [],
    this.info = const InfoModel(),
  });

  factory CharacterModel.fromRawJson(String str) =>
      CharacterModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}

@JsonSerializable()
class CharacterContentModel {
  int id;
  String name;
  String species;
  String type;
  String gender;
  String status;
  final InfoModelOrigin? origin;
  final InfoModelLocation? location;
  final String image;
  final List<String> episode;
  String url;
  String created;

  CharacterContentModel({
    this.id = 0,
    this.name = '',
    this.status = '',
    this.species = '',
    this.type = '',
    this.gender = '',
    this.origin = const InfoModelOrigin(),
    this.location = const InfoModelLocation(),
    this.image = '',
    this.episode = const [],
    this.url = '',
    this.created = '',
  });

  factory CharacterContentModel.fromRawJson(String str) =>
      CharacterContentModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CharacterContentModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterContentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterContentModelToJson(this);
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

@JsonSerializable()
class InfoModelOrigin {
  final String name;
  final String url;

  const InfoModelOrigin({this.name = '', this.url = '', t});

  factory InfoModelOrigin.fromRawJson(String str) =>
      InfoModelOrigin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InfoModelOrigin.fromJson(Map<String, dynamic> json) =>
      _$InfoModelOriginFromJson(json);

  Map<String, dynamic> toJson() => _$InfoModelOriginToJson(this);
}

@JsonSerializable()
class InfoModelLocation {
  final String name;
  final String url;

  const InfoModelLocation({this.name = '', this.url = '', t});

  factory InfoModelLocation.fromRawJson(String str) =>
      InfoModelLocation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InfoModelLocation.fromJson(Map<String, dynamic> json) =>
      _$InfoModelLocationFromJson(json);

  Map<String, dynamic> toJson() => _$InfoModelLocationToJson(this);
}
