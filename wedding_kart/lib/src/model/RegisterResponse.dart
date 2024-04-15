class RegisterResponse {
  final String status;
  final int code;
  final String message;
  final UserData data;

  RegisterResponse({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      data: UserData.fromJson(json['data']),
    );
  }
}

class UserData {
  final int userId;
  final String? fullName;
  final String telephoneNumber;
  final String email;
  final String password;
  final int age;
  final String? gender;
  final String? profession;
  final String? location;
  // Add other properties as needed

  UserData({
    required this.userId,
    this.fullName,
    required this.telephoneNumber,
    required this.email,
    required this.password,
    required this.age,
    this.gender,
    this.profession,
    this.location,
    // Add other properties as needed
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userId: json['userId'],
      fullName: json['fullName'],
      telephoneNumber: json['telephoneNumber'],
      email: json['email'],
      password: json['password'],
      age: json['age'],
      gender: json['gender'],
      profession: json['profession'],
      location: json['location'],
      // Add other properties as needed
    );
  }
}
