import 'dart:convert';

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    Map<String, dynamic> res = Map<String, dynamic>.from(json.decode(_message));
    if (res["error"] == null) {
      return "$_prefix$_message";
    }
    var errorMessage = '';
    if (res["error"] == 'Unauthorised') {
      errorMessage = res["error"];
      return "$errorMessage";
    }
    // Map<String, dynamic>.from(res["error"]).values.first.first;

    for (String key in res['error'].keys) {
      errorMessage += "\n${res['error'][key]?.join(',')}";
    }

    return "$errorMessage";
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
