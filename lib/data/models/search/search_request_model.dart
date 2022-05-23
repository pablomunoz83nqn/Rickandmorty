import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'search_request_model.g.dart';

@JsonSerializable()
class SearchModel {
  SearchModel({
    this.sellerId = '',
    this.appVersion = '',
    this.osName = '',
    this.country = '',
  });

  final String sellerId;
  final String appVersion;
  final String osName;
  final String country;

  SearchModel copyWith({
    String? sellerId,
    String? appVersion,
    String? osName,
    String? country,
  }) =>
      SearchModel(
        sellerId: sellerId ?? this.sellerId,
        appVersion: appVersion ?? this.appVersion,
        osName: osName ?? this.osName,
        country: country ?? this.country,
      );

  factory SearchModel.fromRawJson(String str) =>
      SearchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}
