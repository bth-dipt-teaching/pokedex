sealed class ApiResult<T> {}

class ApiError<T> extends ApiResult<T> {
  final String errorMessage;

  ApiError({required this.errorMessage});
}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;

  ApiSuccess(this.data);
}

extension ApiResultExtension on ApiResult {
  extract() {
    if (this is ApiSuccess) {
      return (this as ApiSuccess).data;
    } else {
      throw (this as ApiError).errorMessage;
    }
  }

  extractOrNull() {
    if (this is ApiSuccess) {
      return (this as ApiSuccess).data;
    } else {
      return null;
    }
  }
}
