class TransplantCenterListModel {
  List<TransplantCenterModel>? data;
  String? message;

  TransplantCenterListModel({this.data, this.message});

  TransplantCenterListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TransplantCenterModel>[];
      json['data'].forEach((v) {
        data!.add(new TransplantCenterModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class TransplantCenterModel {
  String? sId;
  String? profileImage;
  String? name;
  String? email;
  String? address;
  String? unosId;
  String? registeredBy;
  String? password;
  Location? location;
  String? phoneNumber;
  String? paymentStatus;
  String? status;
  String? type;
  String? fcmToken;
  String? createdAt;
  String? updatedAt;
  double? distance;
  bool? isPatientApplied;
  bool? isDonorApplied;

  TransplantCenterModel(
      {this.sId,
      this.profileImage,
      this.name,
      this.email,
      this.address,
      this.unosId,
      this.registeredBy,
      this.password,
      this.location,
      this.phoneNumber,
      this.paymentStatus,
      this.status,
      this.type,
      this.fcmToken,
      this.createdAt,
      this.updatedAt,
      this.distance,
      this.isPatientApplied,
      this.isDonorApplied});

  TransplantCenterModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    profileImage = json['profileImage'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    unosId = json['unosId'];
    registeredBy = json['registeredBy'];
    password = json['password'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    phoneNumber = json['phoneNumber'];
    paymentStatus = json['paymentStatus'];
    status = json['status'];
    type = json['type'];
    fcmToken = json['fcmToken'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    distance = json['distance'];
    isPatientApplied = json['isPatientApplied'];
    isDonorApplied = json['isDonorApplied'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['profileImage'] = this.profileImage;
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['unosId'] = this.unosId;
    data['registeredBy'] = this.registeredBy;
    data['password'] = this.password;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['phoneNumber'] = this.phoneNumber;
    data['paymentStatus'] = this.paymentStatus;
    data['status'] = this.status;
    data['type'] = this.type;
    data['fcmToken'] = this.fcmToken;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['distance'] = this.distance;
    data['isPatientApplied'] = this.isPatientApplied;
    data['isDonorApplied'] = this.isDonorApplied;
    return data;
  }
}

class Location {
  List<double>? coordinates;
  String? type;

  Location({this.coordinates, this.type});

  Location.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'].cast<double>();
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coordinates'] = this.coordinates;
    data['type'] = this.type;
    return data;
  }
}
