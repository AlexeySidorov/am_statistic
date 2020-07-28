import 'package:json_annotation/json_annotation.dart';

part 'CountriesResponce.g.dart';

@JsonSerializable()
class CountriesResponce {
  @JsonKey(name: 'Country')
  String country;
  @JsonKey(name: 'CountryCode')
  String countryCode;
  @JsonKey(name: 'Slug')
  String slug;
  @JsonKey(name: 'NewConfirmed')
  int newConfirmed;
  @JsonKey(name: 'TotalConfirmed')
  int totalConfirmed;
  @JsonKey(name: 'NewDeaths')
  int newDeaths;
  @JsonKey(name: 'TotalDeaths')
  int totalDeaths;
  @JsonKey(name: 'NewRecovered')
  int newRecovered;
  @JsonKey(name: 'TotalRecovered')
  int totalRecovered;
  @JsonKey(name: 'Date')
  DateTime date;

  CountriesResponce(
      this.country,
      this.countryCode,
      this.date,
      this.newConfirmed,
      this.newDeaths,
      this.newRecovered,
      this.slug,
      this.totalConfirmed,
      this.totalDeaths,
      this.totalRecovered);

  factory CountriesResponce.fromJson(Map<String, dynamic> json) =>
      _$CountriesResponceFromJson(json);
  Map<String, dynamic> toJson() => _$CountriesResponceToJson(this);
}
