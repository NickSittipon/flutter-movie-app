import 'package:flutter_mvvm_provider/data/response/status.dart';

class ApiResponse<T> {
  final Status status;
  final T? data;
  final String? message;

  const ApiResponse._({required this.status, this.data, this.message});

  factory ApiResponse.loading([String? message]) =>
      ApiResponse._(status: Status.Loading, message: message);

  factory ApiResponse.completed(T data) =>
      ApiResponse._(status: Status.Success, data: data);

  factory ApiResponse.error([String? message]) =>
      ApiResponse._(status: Status.Error, message: message);

  @override
  String toString() =>
      "Status: $status\nMessage: $message\nData: $data";
}
