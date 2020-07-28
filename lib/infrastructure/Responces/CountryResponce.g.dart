// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CountryResponce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryResponce _$CountryResponceFromJson(Map<String, dynamic> json) {
  return CountryResponce(
    json['Country'] as String,
    json['Slug'] as String,
    json['ISO2'] as String,
    (json['Lat'] as num)?.toDouble(),
    (json['Lon'] as num)?.toDouble(),
    json['LocationID'] as String,
  );
}

Map<String, dynamic> _$CountryResponceToJson(CountryResponce instance) =>
    <String, dynamic>{
      'Country': instance.country,
      'Slug': instance.slug,
      'ISO2': instance.iso2,
      'Lat': instance.lat,
      'Lon': instance.lon,
      'LocationID': instance.locationId,
    };
