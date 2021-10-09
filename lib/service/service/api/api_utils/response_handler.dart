import 'package:http/http.dart' as http;

import 'network_exceptions.dart';

dynamic responseHandler(http.Response response) async {

  // print(response.body);
  // print("status code: ${response.statusCode}");

  switch (response.statusCode) {
    case 201:
      return response.body;
      break;
    case 200:
      return response.body;
      break;
    case 400:
      throw BadRequestException(response.body);
    case 401:
      throw ErrorException(response.body);
    case 403:
      throw UnauthorisedException(response.body);
    case 404:
      throw FileNotFoundException(response.body);
    case 422:
      throw AlreadyRegisteredException(response.body);
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}


dynamic responseHandlerStream(http.StreamedResponse response) async {

  // print(response.body);
  // print("status code: ${response.statusCode}");

  switch (response.statusCode) {
    case 201:
      return response.stream.bytesToString();
      break;
    case 200:
      return response.stream.bytesToString();
      break;
    case 400:
      throw BadRequestException(response.stream.bytesToString());
    case 401:
      throw ErrorException(response.stream.bytesToString());
    case 403:
      throw UnauthorisedException(response.stream.bytesToString());
    case 404:
      throw FileNotFoundException(response.stream.bytesToString().toString());
    case 422:
      throw AlreadyRegisteredException(response.stream.bytesToString().toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}

