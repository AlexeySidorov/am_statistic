import 'package:json_annotation/json_annotation.dart';

part 'CountryResponce.g.dart';

@JsonSerializable()
class CountryResponce {
  @JsonKey(name: 'Country')
  String country;
  @JsonKey(name: 'Slug')
  String slug;
  @JsonKey(name: 'ISO2')
  String iso2;
  @JsonKey(name: 'Lat')
  double lat;
  @JsonKey(name: 'Lon')
  double lon;
  @JsonKey(name: 'LocationID')
  String locationId;

  CountryResponce(this.country, this.slug, this.iso2, this.lat, this.lon, this.locationId);

  factory CountryResponce.fromJson(Map<String, dynamic> json) =>
      _$CountryResponceFromJson(json);
  Map<String, dynamic> toJson() => _$CountryResponceToJson(this);
}
