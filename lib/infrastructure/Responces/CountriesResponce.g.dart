// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CountriesResponce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesResponce _$CountriesResponceFromJson(Map<String, dynamic> json) {
  return CountriesResponce(
    json['Country'] as String,
    json['CountryCode'] as String,
    json['Date'] == null ? null : DateTime.parse(json['Date'] as String),
    json['NewConfirmed'] as int,
    json['NewDeaths'] as int,
    json['NewRecovered'] as int,
    json['Slug'] as String,
    json['TotalConfirmed'] as int,
    json['TotalDeaths'] as int,
    json['TotalRecovered'] as int,
  );
}

Map<String, dynamic> _$CountriesResponceToJson(CountriesResponce instance) =>
    <String, dynamic>{
      'Country': instance.country,
      'CountryCode': instance.countryCode,
      'Slug': instance.slug,
      'NewConfirmed': instance.newConfirmed,
      'TotalConfirmed': instance.totalConfirmed,
      'NewDeaths': instance.newDeaths,
      'TotalDeaths': instance.totalDeaths,
      'NewRecovered': instance.newRecovered,
      'TotalRecovered': instance.totalRecovered,
      'Date': instance.date?.toIso8601String(),
    };
