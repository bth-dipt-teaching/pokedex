import 'dart:io';

import 'package:dio/dio.dart';

///Define all [API] configurations.
class ApiConfig {
  ApiConfig(
    this.baseUrl, {
    this.bearerToken,
    this.apiKey,
    this.appCheckToken,
    Options? options,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
  })  : _connectTimeout = connectTimeout ?? const Duration(seconds: 30),
        _receiveTimeout = receiveTimeout ?? const Duration(seconds: 50),
        _sendTimeout = sendTimeout ?? const Duration(seconds: 50),
        _options = options ??
            Options(
              headers: {
                HttpHeaders.contentTypeHeader: 'application/json',
              },
            );

  Options get options => _options;

  Duration get connectionTimeout => _connectTimeout;

  Duration get receiveTimeout => _receiveTimeout;

  Duration get sendTimeout => _sendTimeout;

  final String baseUrl;
  final Options _options;

  final Duration _connectTimeout;
  final Duration _receiveTimeout;
  final Duration _sendTimeout;

  final TokenCallback? bearerToken;
  final ApiKeyCallback? apiKey;
  final AppCheckTokenCallback? appCheckToken;
}

typedef TokenCallback = String? Function();
typedef ApiKeyCallback = Future<String> Function();
typedef AppCheckTokenCallback = Future<String> Function();
