import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wedding_kart/src/model/RegisterResponse.dart';

class ChopperService {
  static final String baseUrl = 'http://localhost:3577/spring-wedding';

  static Future<RegisterResponse> registerUser(Map<String, dynamic> userData) async {
    final String url = '$baseUrl/login-user';

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userData),
    );

    if (response.statusCode == 200) {
      return RegisterResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to register user');
    }
  }
}
