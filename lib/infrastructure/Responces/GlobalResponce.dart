import 'package:json_annotation/json_annotation.dart';

part 'GlobalResponce.g.dart';

@JsonSerializable()
class GlobalResponce {
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

  GlobalResponce(this.newConfirmed, this.totalConfirmed, this.newDeaths,
      this.totalDeaths, this.newRecovered, this.totalRecovered);

  factory GlobalResponce.fromJson(Map<String, dynamic> json) => _$GlobalResponceFromJson(json);
  Map<String, dynamic> toJson() => _$GlobalResponceToJson(this);
}