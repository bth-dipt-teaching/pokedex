import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedex/app/config/api_config/api_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

///Api client for making api calls, it uses dio as http client and it contains
///all the configurations GET, POST, PUT, DELETE, PATCH requests
class ApiClient {
  ApiClient(
    this._apiConfig, {
    this.clientAdapter,
    this.interceptors,
  });

  final ApiConfig _apiConfig;
  final HttpClientAdapter? clientAdapter;
  final List<Interceptor>? interceptors;

  Dio tdDio() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: _apiConfig.baseUrl,
        connectTimeout: _apiConfig.connectionTimeout,
        receiveTimeout: _apiConfig.receiveTimeout,
        sendTimeout: _apiConfig.sendTimeout,
        headers: _apiConfig.options.headers,
      ),
    );

    if (interceptors != null && interceptors!.isNotEmpty) {
      dio.interceptors
        ..clear()
        ..addAll(interceptors!);
    }

    if (clientAdapter != null) {
      dio.httpClientAdapter = clientAdapter!;
    }

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          responseBody: true,
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      );
    }

    return dio;
  }

  Future<Response> get(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? headers,
  }) async {
    Response response;
    try {
      response = await tdDio().get(
        url,
        data: data,
        queryParameters: queryParameters,
        options: await _getOptions(headers),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
    return response;
  }

  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? headers,
  }) async {
    Response response;
    try {
      response = await tdDio().post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: await _getOptions(headers),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
    return response;
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? headers,
  }) async {
    Response response;
    try {
      response = await tdDio().put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: await _getOptions(headers),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
    return response;
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? headers,
  }) async {
    Response response;
    try {
      response = await tdDio().delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: await _getOptions(headers),
        cancelToken: cancelToken,
      );
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
    return response;
  }

  Future<Options> _getOptions(Map<String, dynamic>? customHeaders) async {
    final headers = {
      ...?_apiConfig.options.headers,
      if (customHeaders != null) ...customHeaders,
    };

    if (_apiConfig.bearerToken != null) {
      final token = _apiConfig.bearerToken!();
      if (token?.isNotEmpty ?? false) {
        headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
      }
    }

    if (_apiConfig.apiKey != null) {
      final apiKey = await _apiConfig.apiKey!();
      if (apiKey.isNotEmpty) {
        headers['x-api-key'] = apiKey;
      }
    }

    if (_apiConfig.appCheckToken != null) {
      final appCheckToken = await _apiConfig.appCheckToken!();
      if (appCheckToken.isNotEmpty) {
        headers['x-app-check-token'] = appCheckToken;
      }
    }

    return Options(
      headers: headers,
    );
  }
}
