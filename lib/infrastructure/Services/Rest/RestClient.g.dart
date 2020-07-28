// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RestClient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://api.covid19api.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getCountries({options}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final newOptions = newRequestOptions(options);
    newOptions.extra.addAll(_extra);
    newOptions.headers.addAll(<String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request('countries',
        queryParameters: queryParameters,
        options: newOptions.merge(method: 'GET', baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => CountryResponce.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getSummaries({options}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final newOptions = newRequestOptions(options);
    newOptions.extra.addAll(_extra);
    newOptions.headers.addAll(<String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request('summary',
        queryParameters: queryParameters,
        options: newOptions.merge(method: 'GET', baseUrl: baseUrl),
        data: _data);
    final value = SummaryResponce.fromJson(_result.data);
    return value;
  }

  @override
  getDayOneConfirmedStatusByCountry(country) async {
    ArgumentError.checkNotNull(country, 'country');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'dayone/country/$country/status/confirmed',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            WorldStatusResponce.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getDayOneAllStatusByCountry(country) async {
    ArgumentError.checkNotNull(country, 'country');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'dayone/country/$country',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => WorldResponce.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getDayOneLiveConfirmedStatusByCountry(country) async {
    ArgumentError.checkNotNull(country, 'country');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'dayone/country/$country/status/confirmed/live',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            WorldStatusResponce.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getDayOneTotalConfirmedStatusByCountry(country) async {
    ArgumentError.checkNotNull(country, 'country');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'country/total/dayone/$country/status/confirmed',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            WorldStatusResponce.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getDayOneTotalAllStatusByCountry(country) async {
    ArgumentError.checkNotNull(country, 'country');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'country/total/dayone/$country',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            WorldStatusResponce.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getConfirmedStatusByCountry(country, fromDate, toDate) async {
    ArgumentError.checkNotNull(country, 'country');
    ArgumentError.checkNotNull(fromDate, 'fromDate');
    ArgumentError.checkNotNull(toDate, 'toDate');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'country/$country/status/confirmed?from=$fromDate&to=$toDate',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            WorldStatusResponce.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getConfirmedAllStatusByCountry(country, fromDate, toDate) async {
    ArgumentError.checkNotNull(country, 'country');
    ArgumentError.checkNotNull(fromDate, 'fromDate');
    ArgumentError.checkNotNull(toDate, 'toDate');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'country/$country?from=$fromDate&to=$toDate',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            WorldStatusResponce.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getLiveConfirmedStatusByCountry(country, fromDate, toDate) async {
    ArgumentError.checkNotNull(country, 'country');
    ArgumentError.checkNotNull(fromDate, 'fromDate');
    ArgumentError.checkNotNull(toDate, 'toDate');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'country/$country/status/confirmed/live?from=$fromDate&to=$toDate',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            WorldStatusResponce.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getTotalConfirmedStatusByCountry(country, fromDate, toDate) async {
    ArgumentError.checkNotNull(country, 'country');
    ArgumentError.checkNotNull(fromDate, 'fromDate');
    ArgumentError.checkNotNull(toDate, 'toDate');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'total/country/$country/status/confirmed?from=$fromDate&to=$toDate',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            WorldStatusResponce.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getTotalAllStatusByCountry(country) async {
    ArgumentError.checkNotNull(country, 'country');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'total/country/$country',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            WorldStatusResponce.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getLiveStatusByCountry(country) async {
    ArgumentError.checkNotNull(country, 'country');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'live/country/$country/status/confirmed',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => WorldResponce.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getLiveAllStatusByCountry(country) async {
    ArgumentError.checkNotNull(country, 'country');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'live/country/$country',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => WorldResponce.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getLiveConfirmedStatusByCountryAndAfterDate(country, afterData) async {
    ArgumentError.checkNotNull(country, 'country');
    ArgumentError.checkNotNull(afterData, 'afterData');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'live/country/$country/status/confirmed/date/$afterData',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => WorldResponce.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getWorldWip(fromDate, toDate) async {
    ArgumentError.checkNotNull(fromDate, 'fromDate');
    ArgumentError.checkNotNull(toDate, 'toDate');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'world?from=$fromDate&to=$toDate',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => WorldResponce.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getTotalWorldWip() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('world?total',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => WorldResponce.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions newRequestOptions(Options options) {
    if (options is RequestOptions) {
      return options;
    }
    if (options == null) {
      return RequestOptions();
    }
    return RequestOptions(
      method: options.method,
      sendTimeout: options.sendTimeout,
      receiveTimeout: options.receiveTimeout,
      extra: options.extra,
      headers: options.headers,
      responseType: options.responseType,
      contentType: options.contentType.toString(),
      validateStatus: options.validateStatus,
      receiveDataWhenStatusError: options.receiveDataWhenStatusError,
      followRedirects: options.followRedirects,
      maxRedirects: options.maxRedirects,
      requestEncoder: options.requestEncoder,
      responseDecoder: options.responseDecoder,
    );
  }
}
