import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'episode_model.g.dart';

@JsonSerializable()
class EpisodeModel {
  final InfoModel? info;
  final List<EpisodeContentModel> results;

  const EpisodeModel({
    this.results = const [],
    this.info = const InfoModel(),
  });

  factory EpisodeModel.fromRawJson(String str) =>
      EpisodeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}

@JsonSerializable()
class EpisodeContentModel {
  int id;
  String name;
  String air_date;
  String episode;
  final List<String> characters;
  String url;
  String created;

  EpisodeContentModel({
    this.id = 0,
    this.name = '',
    this.air_date = '',
    this.episode = '',
    this.characters = const [],
    this.url = '',
    this.created = '',
  });

  factory EpisodeContentModel.fromRawJson(String str) =>
      EpisodeContentModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EpisodeContentModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeContentModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeContentModelToJson(this);
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
