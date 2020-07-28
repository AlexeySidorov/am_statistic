import 'dart:io';

import 'package:statistic_covid19/infrastructure/Responces/CountryResponce.dart';
import 'package:statistic_covid19/infrastructure/Responces/SummaryResponce.dart';
import 'package:statistic_covid19/infrastructure/Responces/WorldResponce.dart';
import 'package:statistic_covid19/infrastructure/Responces/WorldStatusResponce.dart';
import 'package:statistic_covid19/infrastructure/Services/Rest/RestClient.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:dio/adapter.dart';

class RestService {
  RestClient _getClient({Dio dio}) {
    var dio1 = Dio();
    dio1.options.headers['Content-Type'] = 'application/json';
    var currentDio = dio == null ? dio1 : dio;
    _ignoreCertificate(currentDio);

    return RestClient(currentDio);
  }

  void _ignoreCertificate(Dio dio) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };
  }

  Future<List<CountryResponce>> getCountries() async {
    try {
      var getClient = _getClient();
      return await getClient.getCountries();
    } catch (Exception) {
      return null;
    }
  }

  Future<SummaryResponce> getSummaries() async {
    try {
      var getClient = _getClient();
      return await getClient.getSummaries();
    } catch (Exception) {
      return null;
    }
  }

  ///GET Day One
  Future<List<WorldStatusResponce>> getDayOneConfirmedStatusByCountry(
      String country) async {
    try {
      var getClient = _getClient();
      return await getClient.getDayOneConfirmedStatusByCountry(country);
    } catch (Exception) {
      return null;
    }
  }

  ///GET Day One All Status
  Future<List<WorldResponce>> getDayOneAllStatusByCountry(
      String country) async {
    try {
      var getClient = _getClient();
      return await getClient.getDayOneAllStatusByCountry(country);
    } catch (Exception) {
      return null;
    }
  }

  ///GET Day One Live
  Future<List<WorldStatusResponce>> getDayOneLiveConfirmedStatusByCountry(
      String country) async {
    try {
      var getClient = _getClient();
      return await getClient.getDayOneLiveConfirmedStatusByCountry(country);
    } catch (Exception) {
      return null;
    }
  }

  ///GET Day One Total
  Future<List<WorldStatusResponce>> getDayOneTotalConfirmedStatusByCountry(
      String country) async {
    try {
      var getClient = _getClient();
      return await getClient.getDayOneTotalConfirmedStatusByCountry(country);
    } catch (Exception) {
      return null;
    }
  }

  ///GET Day One Total All Status
  Future<List<WorldStatusResponce>> getDayOneTotalAllStatusByCountry(
      String country) async {
    try {
      var getClient = _getClient();
      return await getClient.getDayOneTotalAllStatusByCountry(country);
    } catch (Exception) {
      return null;
    }
  }

  ///GET By Country
  Future<List<WorldStatusResponce>> getConfirmedStatusByCountry(
      String country, DateTime fromDate, DateTime toDate) async {
    try {
      var getClient = _getClient();
      return await getClient.getConfirmedStatusByCountry(
          country, fromDate, toDate);
    } catch (Exception) {
      return null;
    }
  }

  ///GET By Country All Status
  Future<List<WorldStatusResponce>> getConfirmedAllStatusByCountry(
      String country, DateTime fromDate, DateTime toDate) async {
    try {
      var getClient = _getClient();
      return await getClient.getConfirmedAllStatusByCountry(
          country, fromDate, toDate);
    } catch (Exception) {
      return null;
    }
  }

  ///GET By Country Live
  Future<List<WorldStatusResponce>> getLiveConfirmedStatusByCountry(
      String country, DateTime fromDate, DateTime toDate) async {
    try {
      var getClient = _getClient();
      return await getClient.getLiveConfirmedStatusByCountry(
          country, fromDate, toDate);
    } catch (Exception) {
      return null;
    }
  }

  ///GET By Country Total
  Future<List<WorldStatusResponce>> getTotalConfirmedStatusByCountry(
      String country, DateTime fromDate, DateTime toDate) async {
    try {
      var getClient = _getClient();
      return await getClient.getTotalConfirmedStatusByCountry(
          country, fromDate, toDate);
    } catch (Exception) {
      return null;
    }
  }

  ///GET By Country Total All Status
  Future<List<WorldStatusResponce>> getTotalAllStatusByCountry(
      String country) async {
    try {
      var getClient = _getClient();
      return await getClient.getTotalAllStatusByCountry(country);
    } catch (Exception) {
      return null;
    }
  }

  ///GET Live By Country And Status
  Future<List<WorldResponce>> getLiveStatusByCountry(String country) async {
    try {
      var getClient = _getClient();
      return await getClient.getLiveStatusByCountry(country);
    } catch (Exception) {
      return null;
    }
  }

  ///GET Live By Country All Status
  Future<List<WorldResponce>> getLiveAllStatusByCountry(String country) async {
    try {
      var getClient = _getClient();
      return await getClient.getLiveAllStatusByCountry(country);
    } catch (Exception) {
      return null;
    }
  }

  ///GET Live By Country And Status After Date
  Future<List<WorldResponce>> getLiveConfirmedStatusByCountryAndAfterDate(
      String country, DateTime afterData) async {
    try {
      var getClient = _getClient();
      return await getClient.getLiveConfirmedStatusByCountryAndAfterDate(
          country, afterData);
    } catch (Exception) {
      return null;
    }
  }

  ///GET World WIP
  Future<List<WorldResponce>> getWorldWip(
      DateTime fromDate, DateTime toDate) async {
    try {
      var getClient = _getClient();
      return await getClient.getWorldWip(fromDate, toDate);
    } catch (Exception) {
      return null;
    }
  }

  ///GET World Total WIP
  Future<List<WorldResponce>> getTotalWorldWip() async {
    try {
      var getClient = _getClient();
      return await getClient.getTotalWorldWip();
    } catch (Exception) {
      return null;
    }
  }
}
