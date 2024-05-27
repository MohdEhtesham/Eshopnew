class PhoneLoginModel {
  Data? data;
  String? message;

  PhoneLoginModel({this.data, this.message});

  PhoneLoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? phoneNumber;
  String? otp;
  String? userType;
  String? name;
  String? profileImage;
  String? languagePreference;
  String? status;
  String? fcmToken;
  String? createdAt;
  String? updatedAt;
  String? email;

  User(
      {this.sId,
      this.phoneNumber,
      this.otp,
      this.userType,
      this.name,
      this.profileImage,
      this.languagePreference,
      this.status,
      this.fcmToken,
      this.createdAt,
      this.updatedAt,
      this.email});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phoneNumber = json['phoneNumber'];
    otp = json['otp'];
    userType = json['userType'];
    name = json['name'];
    profileImage = json['profileImage'];
    languagePreference = json['languagePreference'];
    status = json['status'];
    fcmToken = json['fcmToken'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['phoneNumber'] = this.phoneNumber;
    data['otp'] = this.otp;
    data['userType'] = this.userType;
    data['name'] = this.name;
    data['profileImage'] = this.profileImage;
    data['languagePreference'] = this.languagePreference;
    data['status'] = this.status;
    data['fcmToken'] = this.fcmToken;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['email'] = this.email;
    return data;
  }
}