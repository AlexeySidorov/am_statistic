// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WorldStatusResponce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorldStatusResponce _$WorldStatusResponceFromJson(Map<String, dynamic> json) {
  return WorldStatusResponce(
    json['Country'] as String,
    json['CountryCode'] as String,
    json['Date'] == null ? null : DateTime.parse(json['Date'] as String),
    (json['Lat'] as num)?.toDouble(),
    (json['Lon'] as num)?.toDouble(),
    json['Cases'] as int,
    _$enumDecodeNullable(_$StatusEnumMap, json['Status']),
  );
}

Map<String, dynamic> _$WorldStatusResponceToJson(
        WorldStatusResponce instance) =>
    <String, dynamic>{
      'Country': instance.country,
      'CountryCode': instance.countryCode,
      'Lat': instance.lat,
      'Lon': instance.lon,
      'Cases': instance.cases,
      'Status': _$StatusEnumMap[instance.status],
      'Date': instance.date?.toIso8601String(),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$StatusEnumMap = {
  Status.confirmed: 'confirmed',
  Status.none: 'none',
};
