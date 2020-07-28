// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GlobalResponce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalResponce _$GlobalResponceFromJson(Map<String, dynamic> json) {
  return GlobalResponce(
    json['NewConfirmed'] as int,
    json['TotalConfirmed'] as int,
    json['NewDeaths'] as int,
    json['TotalDeaths'] as int,
    json['NewRecovered'] as int,
    json['TotalRecovered'] as int,
  );
}

Map<String, dynamic> _$GlobalResponceToJson(GlobalResponce instance) =>
    <String, dynamic>{
      'NewConfirmed': instance.newConfirmed,
      'TotalConfirmed': instance.totalConfirmed,
      'NewDeaths': instance.newDeaths,
      'TotalDeaths': instance.totalDeaths,
      'NewRecovered': instance.newRecovered,
      'TotalRecovered': instance.totalRecovered,
    };
