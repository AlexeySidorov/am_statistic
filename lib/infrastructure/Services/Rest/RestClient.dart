import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:statistic_covid19/infrastructure/Responces/CountryResponce.dart';
import 'package:statistic_covid19/infrastructure/Responces/SummaryResponce.dart';
import 'package:statistic_covid19/infrastructure/Responces/WorldResponce.dart';
import 'package:statistic_covid19/infrastructure/Responces/WorldStatusResponce.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: "https://api.covid19api.com/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  ///GET Countries
  @GET('countries')
  Future<List<CountryResponce>> getCountries({@DioOptions() options});

  ///GET Summary
  @GET('summary')
  Future<SummaryResponce> getSummaries({@DioOptions() options});

  ///GET Day One
  @GET('dayone/country/{country}/status/confirmed')
  Future<List<WorldStatusResponce>> getDayOneConfirmedStatusByCountry(
      @Path('country') String country);

  ///GET Day One All Status
  @GET('dayone/country/{country}')
  Future<List<WorldResponce>> getDayOneAllStatusByCountry(
      @Path('country') String country);

  ///GET Day One Live
  @GET('dayone/country/{country}/status/confirmed/live')
  Future<List<WorldStatusResponce>> getDayOneLiveConfirmedStatusByCountry(
      @Path('country') String country);

  ///GET Day One Total
  @GET('country/total/dayone/{country}/status/confirmed')
  Future<List<WorldStatusResponce>> getDayOneTotalConfirmedStatusByCountry(
      @Path('country') String country);

  ///GET Day One Total All Status
  @GET('country/total/dayone/{country}')
  Future<List<WorldStatusResponce>> getDayOneTotalAllStatusByCountry(
      @Path('country') String country);

  ///GET By Country
  @GET('country/{country}/status/confirmed?from={fromDate}&to={toDate}')
  Future<List<WorldStatusResponce>> getConfirmedStatusByCountry(
      @Path('country') String country,
      @Path('fromDate') DateTime fromDate,
      @Path('toDate') DateTime toDate);

  ///GET By Country All Status
  @GET('country/{country}?from={fromDate}&to={toDate}')
  Future<List<WorldStatusResponce>> getConfirmedAllStatusByCountry(
      @Path('country') String country,
      @Path('fromDate') DateTime fromDate,
      @Path('toDate') DateTime toDate);

  ///GET By Country Live
  @GET('country/{country}/status/confirmed/live?from={fromDate}&to={toDate}')
  Future<List<WorldStatusResponce>> getLiveConfirmedStatusByCountry(
      @Path('country') String country,
      @Path('fromDate') DateTime fromDate,
      @Path('toDate') DateTime toDate);

  ///GET By Country Total
  @GET('total/country/{country}/status/confirmed?from={fromDate}&to={toDate}')
  Future<List<WorldStatusResponce>> getTotalConfirmedStatusByCountry(
      @Path('country') String country,
      @Path('fromDate') DateTime fromDate,
      @Path('toDate') DateTime toDate);

  ///GET By Country Total All Status
  @GET('total/country/{country}')
  Future<List<WorldStatusResponce>> getTotalAllStatusByCountry(
      @Path('country') String country);

  ///GET Live By Country And Status
  @GET('live/country/{country}/status/confirmed')
  Future<List<WorldResponce>> getLiveStatusByCountry(
      @Path('country') String country);

  ///GET Live By Country All Status
  @GET('live/country/{country}')
  Future<List<WorldResponce>> getLiveAllStatusByCountry(
      @Path('country') String country);

  ///GET Live By Country And Status After Date
  @GET('live/country/{country}/status/confirmed/date/{afterData}')
  Future<List<WorldResponce>> getLiveConfirmedStatusByCountryAndAfterDate(
      @Path('country') String country, @Path('afterData') DateTime afterData);

  ///GET World WIP
  @GET('world?from={fromDate}&to={toDate}')
  Future<List<WorldResponce>> getWorldWip(
      @Path('fromDate') DateTime fromDate, @Path('toDate') DateTime toDate);

  @GET('world?total')
  Future<List<WorldResponce>> getTotalWorldWip();
}
