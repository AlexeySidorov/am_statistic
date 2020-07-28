import 'package:json_annotation/json_annotation.dart';

part 'WorldResponce.g.dart';

@JsonSerializable()
class WorldResponce {
  @JsonKey(name: 'Country')
  String country;
  @JsonKey(name: 'CountryCode')
  String countryCode;
  @JsonKey(name: 'Province')
  String province;
  @JsonKey(name: 'City')
  String city;
  @JsonKey(name: 'Lat')
  String lat;
  @JsonKey(name: 'Lon')
  String lon;
  @JsonKey(name: 'Confirmed')
  int confirmed;
  @JsonKey(name: 'Deaths')
  int deaths;
  @JsonKey(name: 'Recovered')
  int recovered;
  @JsonKey(name: 'Active')
  int active;
  @JsonKey(name: 'Date')
  DateTime date;
  @JsonKey(name: 'LocationID')
  String locationId;

  WorldResponce(
      this.active,
      this.confirmed,
      this.country,
      this.countryCode,
      this.date,
      this.deaths,
      this.lat,
      this.locationId,
      this.lon,
      this.recovered);

  factory WorldResponce.fromJson(Map<String, dynamic> json) =>
      _$WorldResponceFromJson(json);
  Map<String, dynamic> toJson() => _$WorldResponceToJson(this);
}
