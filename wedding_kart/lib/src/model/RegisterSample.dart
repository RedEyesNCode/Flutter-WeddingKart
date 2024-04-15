class RegisterSample {
  final String status;
  final int code;
  final String message;
  final RegisterData data;

  RegisterSample({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory RegisterSample.fromJson(Map<String, dynamic> json) {
    return RegisterSample(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      data: RegisterData.fromJson(json['data']),
    );
  }
}

class RegisterData {
  final int userId;
  final String fullName;
  final String telephoneNumber;
  final String emailAddress;
  final String customerKey;
  final String password;
  final String walletBalance;

  RegisterData({
    required this.userId,
    required this.fullName,
    required this.telephoneNumber,
    required this.emailAddress,
    required this.customerKey,
    required this.password,
    required this.walletBalance,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
      userId: json['userId'],
      fullName: json['fullName'],
      telephoneNumber: json['telephoneNumber'],
      emailAddress: json['emailAddress'],
      customerKey: json['customerKey'],
      password: json['password'],
      walletBalance: json['walletBalance'],
    );
  }
}
