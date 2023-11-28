import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedex/app/service_result/api_result.dart';

typedef TypeDef = Function();

Future<ApiResult<T>> apiInterceptor<T>(TypeDef func) async {
  try {
    final result = await func();

    return ApiSuccess(result);
  } on DioException catch (exception) {
    // log(exception.response.toString());
    return exception.response?.statusCode == 400 ||
            exception.response?.data['message'] != null
        ? ApiError(errorMessage: exception.response?.data['message'])
        : ApiError(errorMessage: 'Unexpected error occurred');
  } on Error catch (e) {
    debugPrint(e.stackTrace.toString());
    return ApiError(errorMessage: 'Unexpected error occurred');
  } catch (e) {
    debugPrint(e.toString());
    return ApiError(errorMessage: 'Unexpected error occurred');
  }
}
