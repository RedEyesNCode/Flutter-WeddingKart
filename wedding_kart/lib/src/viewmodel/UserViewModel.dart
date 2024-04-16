import 'package:flutter/material.dart';
import 'package:wedding_kart/src/model/RegisterResponse.dart';
import 'package:wedding_kart/src/model/RegisterSample.dart';
import 'package:wedding_kart/src/model/login_response.dart';
import 'package:wedding_kart/src/repository/MainRepository.dart';
import 'package:wedding_kart/src/services/AppHttpService.dart';
import 'package:wedding_kart/src/utils/api_response.dart';
import 'package:wedding_kart/src/utils/app_exception.dart';

class UserViewModel with ChangeNotifier {

  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  RegisterResponse? _registerResponse;

  login_response? _loginResponse;


  ApiResponse get response {
    return _apiResponse;
  }

  login_response? get loginResponse{
    return _loginResponse;

  }

  RegisterResponse? get registerResponse {
    return _registerResponse;
  }

  Future<void> loginUser(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    try {
      login_response? response = await MainRepository().loginUser(userData);
      if (response != null) {
        _apiResponse = ApiResponse.completed(response);
        _loginResponse = response;
      } else {
        _apiResponse = ApiResponse.error('Received null response');
      }
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners(); // Notify listeners only once after all state changes
  }

  /// Call the user service and register the user.
  Future<void> registerUser(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Registering user');
    notifyListeners();
    try {
      RegisterResponse? response = await MainRepository().registerUser(userData);
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
