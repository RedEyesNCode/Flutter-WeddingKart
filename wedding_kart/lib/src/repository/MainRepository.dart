

import 'package:wedding_kart/src/model/RegisterResponse.dart';
import 'package:wedding_kart/src/model/RegisterSample.dart';
import 'package:wedding_kart/src/services/AppHttpService.dart';
import 'package:wedding_kart/src/services/base_service.dart';

class MainRepository {
  BaseService _userService = AppHttpService();

  Future<RegisterSample> registerUser(Map<String, dynamic> userData) async {
    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.registerUser(userData);

      // Assuming the response is in the format you provided earlier
      return RegisterSample.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }
  }
}