// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WorldResponce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorldResponce _$WorldResponceFromJson(Map<String, dynamic> json) {
  return WorldResponce(
    json['Active'] as int,
    json['Confirmed'] as int,
    json['Country'] as String,
    json['CountryCode'] as String,
    json['Date'] == null ? null : DateTime.parse(json['Date'] as String),
    json['Deaths'] as int,
    json['Lat'] as String,
    json['LocationID'] as String,
    json['Lon'] as String,
    json['Recovered'] as int,
  )
    ..province = json['Province'] as String
    ..city = json['City'] as String;
}

Map<String, dynamic> _$WorldResponceToJson(WorldResponce instance) =>
    <String, dynamic>{
      'Country': instance.country,
      'CountryCode': instance.countryCode,
      'Province': instance.province,
      'City': instance.city,
      'Lat': instance.lat,
      'Lon': instance.lon,
      'Confirmed': instance.confirmed,
      'Deaths': instance.deaths,
      'Recovered': instance.recovered,
      'Active': instance.active,
      'Date': instance.date?.toIso8601String(),
      'LocationID': instance.locationId,
    };
