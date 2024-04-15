import 'package:flutter/material.dart';
import 'package:wedding_kart/src/model/RegisterResponse.dart';
import 'package:wedding_kart/src/services/AppHttpService.dart';

class UserViewModel extends ChangeNotifier {
  Future<RegisterResponse> registerUser(Map<String, dynamic> userData) async {
    try {
      final response = await AppHttpService.registerUser(userData);
      // Handle success
      return response;
    } catch (error) {
      // Handle error
      throw error;
    }
  }
}
