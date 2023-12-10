import 'status.dart';

class APIResponse<T> {
  Status? status;
  T? data;
  String? message;

  APIResponse(this.status, this.data, this.message);

  APIResponse.loading() : status = Status.loading;
  APIResponse.completed() : status = Status.completed;
  APIResponse.error() : status = Status.error;

  @override
  String toString() {
    return 'Status: $status\nMessage: $message\nData: $data';
  }
}
