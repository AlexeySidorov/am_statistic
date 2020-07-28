// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SummaryResponce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryResponce _$SummaryResponceFromJson(Map<String, dynamic> json) {
  return SummaryResponce(
    (json['Countries'] as List)
        ?.map((e) => e == null
            ? null
            : CountriesResponce.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['Global'] == null
        ? null
        : GlobalResponce.fromJson(json['Global'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SummaryResponceToJson(SummaryResponce instance) =>
    <String, dynamic>{
      'Global': instance.global,
      'Countries': instance.countries,
    };
