abstract class BaseService {
  final String BaseUrl = "https://gsfinance.app:5643/megma-cibil/";

  Future<dynamic> getResponse(String url);
  Future<dynamic> registerUser(Map<String, dynamic> userData);

}