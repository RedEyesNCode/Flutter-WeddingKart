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
  bool _shouldNotifyListeners = false; // Flag to control listener notification

  ApiResponse get response => _apiResponse;
  login_response? get loginResponse => _loginResponse;
  RegisterResponse? get registerResponse => _registerResponse;

  void _notifyListenersIfNeeded() {
    if (_shouldNotifyListeners) {
      notifyListeners();
      _shouldNotifyListeners = false; // Reset flag after notifying listeners
    }
  }

  Future<void> loginUser(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners
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
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }

  Future<void> registerUser(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Registering user');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    try {
      RegisterResponse? response = await MainRepository().registerUser(userData);
      if (response != null) {
        _apiResponse = ApiResponse.completed(response);
        _registerResponse = response;
      } else {
        _apiResponse = ApiResponse.error('Received null response');
      }
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }
}

