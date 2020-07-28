import 'package:json_annotation/json_annotation.dart';
import 'package:statistic_covid19/infrastructure/Responces/CountriesResponce.dart';
import 'package:statistic_covid19/infrastructure/Responces/GlobalResponce.dart';

part 'SummaryResponce.g.dart';

@JsonSerializable()
class SummaryResponce {
  @JsonKey(name: 'Global')
  GlobalResponce global;
  @JsonKey(name: 'Countries')
  List<CountriesResponce> countries;
  
  SummaryResponce(this.countries, this.global);

  factory SummaryResponce.fromJson(Map<String, dynamic> json) =>
      _$SummaryResponceFromJson(json);
  Map<String, dynamic> toJson() => _$SummaryResponceToJson(this);
}
