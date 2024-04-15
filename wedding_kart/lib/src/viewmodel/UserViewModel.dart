import 'package:flutter/material.dart';
import 'package:wedding_kart/src/model/RegisterResponse.dart';
import 'package:wedding_kart/src/model/RegisterSample.dart';
import 'package:wedding_kart/src/repository/MainRepository.dart';
import 'package:wedding_kart/src/services/AppHttpService.dart';
import 'package:wedding_kart/src/utils/api_response.dart';
import 'package:wedding_kart/src/utils/app_exception.dart';

class UserViewModel with ChangeNotifier {

  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  RegisterSample? _registerResponse;

  ApiResponse get response {
    return _apiResponse;
  }

  RegisterSample? get registerResponse {
    return _registerResponse;
  }

  /// Call the user service and register the user.
  Future<void> registerUser(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Registering user');
    notifyListeners();
    try {
      RegisterSample? response = await MainRepository().registerUser(userData);
      if (response != null) {
        _apiResponse = ApiResponse.completed(response);
        _registerResponse = response;
      } else {
        _apiResponse = ApiResponse.error('Received null response');
      }
    } on FetchDataException{
      _apiResponse = ApiResponse.error('No Internet Connection');

    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

}
