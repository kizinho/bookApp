import 'dart:io';

import 'package:http/http.dart' as api;

import 'network_exceptions.dart';
import 'response_handler.dart';

class API {
  //API client
  static var client = api.Client();

  Future get(String url, header) async {
    var responseJson;
    try {
      var res;

      if (header != null) {
        res = await client.get(Uri.parse(url), headers: header);
      } else {
        res = await client.get(Uri.parse(url));
      }
      responseJson = responseHandler(res);
    } on SocketException {
      //network error
      throw NetworkException("Network error occurred");
    }

    return responseJson;
  }

  Future post(String url, header, body) async {
    var responseJson;
    try {
      ///Log collected Info
      // print('url: $url \nheader: $header\nbody: $body');
      var res = await client.post(Uri.parse(url), headers: header, body: body);
      responseJson = await responseHandler(res);
      //Check respose
      // print(responseJson.toString());
    } on SocketException {
      //network error
      throw NetworkException("Network error occurred");
    }
    return responseJson;
  }

  Future put(String url, header, {body}) async {
    var responseJson;
    try {
      var res = await client.post(Uri.parse(url), headers: header, body: body);
      responseJson = responseHandler(res);
    } on SocketException {
      //network error
      throw NetworkException("Network error occurred");
    }
    return responseJson;
  }

  Future patch(String url, header, {body}) async {
    var responseJson;
    try {
      var res = await client.patch(Uri.parse(url), headers: header, body: body);
      responseJson = responseHandler(res);
    } on SocketException {
      //network error
      throw NetworkException("Network error occurred");
    }
    return responseJson;
  }

  Future delete(String url, header) async {
    var responseJson;
    try {
      var res = await client.delete(Uri.parse(url), headers: header);
      responseJson = responseHandler(res);
    } on SocketException {
      //network error
      throw NetworkException("Network error occurred");
    }
    return responseJson;
  }

  Future uploadFile(String url, header, body) async {
    var responseJson;
    try {
      ///Log collected Info
      // print('url: $url \nheader: $header\nbody: $body');
      var res = api.MultipartRequest("POST", Uri.parse(url));
      // res.fields.addAll(data);
      var profilePhoto = api.MultipartFile(
          'image', body.readAsBytes().asStream(), body.lengthSync(),
          filename: body.path);
      res.headers.addAll(header);
      res.files.add(profilePhoto);
      api.StreamedResponse response = await res.send();
      responseJson = await responseHandlerStream(response);
    } on SocketException {
      //network error
      throw NetworkException("Network error occurred");
    }
    return responseJson;
  }
}
