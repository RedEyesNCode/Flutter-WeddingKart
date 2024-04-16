class login_response {
  final String status;
  final int code;
  final String message;
  final UserData? data;

  login_response({
    required this.status,
    required this.code,
    required this.message,
    this.data,
  });

  factory login_response.fromJson(Map<String, dynamic> json) {
    return login_response(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  final int userId;
  final String? fullName;
  final String? firstName;
  final String? lastName;
  final String? dateOfBirth;
  final String? height;
  final String telephoneNumber;
  final String email;
  final String password;
  final int age;
  final String? gender;
  final String? profession;
  final String? location;
  final String? createdFor;
  final String? martialStatus;
  final String? motherTongue;
  final String? community;
  final String? familyLocation;
  final String? nativePlace;
  final String? education;
  final String? jobTitle;
  final String? workIn;
  final String? companyName;
  final String? annualIncome;
  final String? fatherStatus;
  final String? motherStatus;
  final int? noOfBrothers;
  final int? noOfSisters;
  final String? profilePic;

  UserData({
    required this.userId,
    this.fullName,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.height,
    required this.telephoneNumber,
    required this.email,
    required this.password,
    required this.age,
    this.gender,
    this.profession,
    this.location,
    this.createdFor,
    this.martialStatus,
    this.motherTongue,
    this.community,
    this.familyLocation,
    this.nativePlace,
    this.education,
    this.jobTitle,
    this.workIn,
    this.companyName,
    this.annualIncome,
    this.fatherStatus,
    this.motherStatus,
    this.noOfBrothers,
    this.noOfSisters,
    this.profilePic,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userId: json['userId'],
      fullName: json['fullName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      dateOfBirth: json['dateOfBirth'],
      height: json['height'],
      telephoneNumber: json['telephoneNumber'],
      email: json['email'],
      password: json['password'],
      age: json['age'],
      gender: json['gender'],
      profession: json['profession'],
      location: json['location'],
      createdFor: json['createdFor'],
      martialStatus: json['martialStatus'],
      motherTongue: json['mother_tonque'],
      community: json['community'],
      familyLocation: json['family_location'],
      nativePlace: json['nativePlace'],
      education: json['education'],
      jobTitle: json['jobTitle'],
      workIn: json['workIn'],
      companyName: json['companyName'],
      annualIncome: json['annualIncome'],
      fatherStatus: json['fatherStatus'],
      motherStatus: json['motherStatus'],
      noOfBrothers: json['noOfBrothers'],
      noOfSisters: json['noOfSisters'],
      profilePic: json['profilePic'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = this.userId;
    data['fullName'] = this.fullName;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['dateOfBirth'] = this.dateOfBirth;
    data['height'] = this.height;
    data['telephoneNumber'] = this.telephoneNumber;
    data['email'] = this.email;
    data['password'] = this.password;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['profession'] = this.profession;
    data['location'] = this.location;
    data['createdFor'] = this.createdFor;
    data['martialStatus'] = this.martialStatus;
    data['motherTongue'] = this.motherTongue;
    data['community'] = this.community;
    data['familyLocation'] = this.familyLocation;
    data['nativePlace'] = this.nativePlace;
    data['education'] = this.education;
    data['jobTitle'] = this.jobTitle;
    data['workIn'] = this.workIn;
    data['companyName'] = this.companyName;
    data['annualIncome'] = this.annualIncome;
    data['fatherStatus'] = this.fatherStatus;
    data['motherStatus'] = this.motherStatus;
    data['noOfBrothers'] = this.noOfBrothers;
    data['noOfSisters'] = this.noOfSisters;
    data['profilePic'] = this.profilePic;
    return data;
  }
}
