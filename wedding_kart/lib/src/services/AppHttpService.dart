import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:wedding_kart/src/model/RegisterResponse.dart';
import 'package:wedding_kart/src/services/base_service.dart';
import 'package:wedding_kart/src/utils/app_exception.dart';

class AppHttpService extends BaseService {
  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(BaseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future<dynamic> registerUser(Map<String, dynamic> userData) async {
    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'create-new-user'), // Adjust the endpoint accordingly
        body: jsonEncode(userData),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
