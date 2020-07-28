import 'package:json_annotation/json_annotation.dart';

part 'WorldStatusResponce.g.dart';

@JsonSerializable()
class WorldStatusResponce {
  @JsonKey(name: 'Country')
  String country;
  @JsonKey(name: 'CountryCode')
  String countryCode;
  @JsonKey(name: 'Lat')
  double lat;
  @JsonKey(name: 'Lon')
  double lon;
  @JsonKey(name: 'Cases')
  int cases;
  @JsonKey(name: 'Status')
  Status status;
  @JsonKey(name: 'Date')
  DateTime date;

  WorldStatusResponce(this.country, this.countryCode, this.date, this.lat,
      this.lon, this.cases, this.status);

  factory WorldStatusResponce.fromJson(Map<String, dynamic> json) =>
      _$WorldStatusResponceFromJson(json);
  Map<String, dynamic> toJson() => _$WorldStatusResponceToJson(this);
}

enum Status { confirmed, none }
