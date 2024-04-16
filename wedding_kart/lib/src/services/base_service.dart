abstract class BaseService {
  final String BaseUrl = "http://13.126.22.120:6751/wedding-star/";

  Future<dynamic> getResponse(String url);
  Future<dynamic> registerUser(Map<String, dynamic> userData);
  Future<dynamic> loginUser(Map<String, dynamic> userData);

}