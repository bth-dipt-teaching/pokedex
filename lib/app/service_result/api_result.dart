/// A sealed class [ApiResult] that handles all [API] requests

sealed class ApiResult<T> {}

class ApiError<T> extends ApiResult<T> {
  final String errorMessage;

  ApiError({required this.errorMessage});
}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;

  ApiSuccess(this.data);
}

/// An extension to extract [ApiResult]
extension ApiResultExtension on ApiResult {
  //extract response
  extract() {
    if (this is ApiSuccess) {
      return (this as ApiSuccess).data;
    } else {
      throw (this as ApiError).errorMessage;
    }
  }

  //extract successful response or null when it is an error
  extractOrNull() {
    if (this is ApiSuccess) {
      return (this as ApiSuccess).data;
    } else {
      return null;
    }
  }
}
