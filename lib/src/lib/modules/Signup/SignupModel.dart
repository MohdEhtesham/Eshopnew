class Signup {
  Token? token;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? password;
  String? phone;
  String? createdAt;
  String? deviceToken;
  bool? phoneNumberVerified;
  bool? active;
  bool? isDeleted;
  String? updatedAt;
  String? id;
  String? roleId;

  Signup(
      {this.token,
      this.firstName,
      this.lastName,
      this.fullName,
      this.email,
      this.password,
      this.phone,
      this.createdAt,
      this.deviceToken,
      this.phoneNumberVerified,
      this.active,
      this.isDeleted,
      this.updatedAt,
      this.id,
      this.roleId});

  Signup.fromJson(Map<String, dynamic> json) {
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    createdAt = json['createdAt'];
    deviceToken = json['deviceToken'];
    phoneNumberVerified = json['phoneNumberVerified'];
    active = json['active'];
    isDeleted = json['is_deleted'];
    updatedAt = json['updatedAt'];
    id = json['id'];
    roleId = json['roleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['createdAt'] = this.createdAt;
    data['deviceToken'] = this.deviceToken;
    data['phoneNumberVerified'] = this.phoneNumberVerified;
    data['active'] = this.active;
    data['is_deleted'] = this.isDeleted;
    data['updatedAt'] = this.updatedAt;
    data['id'] = this.id;
    data['roleId'] = this.roleId;
    return data;
  }
}

class Token {
  String? id;
  int? ttl;
  String? created;
  String? userId;

  Token({this.id, this.ttl, this.created, this.userId});

  Token.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ttl = json['ttl'];
    created = json['created'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ttl'] = this.ttl;
    data['created'] = this.created;
    data['userId'] = this.userId;
    return data;
  }
}