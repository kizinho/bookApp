class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class NetworkException extends AppException {
  NetworkException([String? message]) : super(message, "No Internet ");
}

class FileNotFoundException extends AppException {
  FileNotFoundException([String? message]) : super(message, "File not found ");
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class ErrorException extends AppException {
  ErrorException([message]) : super(message);
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class AlreadyRegisteredException extends AppException {
  AlreadyRegisteredException([String? message])
      : super(message, "Invalid Input: ");
}
