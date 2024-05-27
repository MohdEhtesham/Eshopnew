class Login {
  String? id;
  int? ttl;
  String? created;
  String? userId;
  User? user;

  Login({this.id, this.ttl, this.created, this.userId, this.user});

  Login.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ttl = json['ttl'];
    created = json['created'];
    userId = json['userId'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ttl'] = this.ttl;
    data['created'] = this.created;
    data['userId'] = this.userId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? roleId;
  String? firstName;
  String? lastName;
  String? fullName;
  bool? isDeleted;
  bool? active;
  String? phone;
  String? email;
  bool? phoneNumberVerified;
  String? deviceToken;
  String? id;
  String? createdAt;
  String? updatedAt;

  User(
      {this.roleId,
      this.firstName,
      this.lastName,
      this.fullName,
      this.isDeleted,
      this.active,
      this.phone,
      this.email,
      this.phoneNumberVerified,
      this.deviceToken,
      this.id,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    isDeleted = json['is_deleted'];
    active = json['active'];
    phone = json['phone'];
    email = json['email'];
    phoneNumberVerified = json['phoneNumberVerified'];
    deviceToken = json['deviceToken'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roleId'] = this.roleId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['fullName'] = this.fullName;
    data['is_deleted'] = this.isDeleted;
    data['active'] = this.active;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['phoneNumberVerified'] = this.phoneNumberVerified;
    data['deviceToken'] = this.deviceToken;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
