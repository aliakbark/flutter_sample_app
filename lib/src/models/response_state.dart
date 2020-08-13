class ResponseState<T> {
  ResponseState._();

  factory ResponseState.success(T value) = SuccessResponseState<T>;

  factory ResponseState.error(T msg) = ErrorResponseState<T>;
}

class ErrorResponseState<T> extends ResponseState<T> {
  ErrorResponseState(this.msg) : super._();
  final T msg;
}

class SuccessResponseState<T> extends ResponseState<T> {
  SuccessResponseState(this.value) : super._();
  final T value;
}
