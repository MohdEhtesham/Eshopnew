class ImageUpload {
  Result? result;

  ImageUpload({this.result});

  ImageUpload.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  Files? files;

  Result({this.files});

  Result.fromJson(Map<String, dynamic> json) {
    files = json['files'] != null ? new Files.fromJson(json['files']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.files != null) {
      data['files'] = this.files!.toJson();
    }
    return data;
  }
}

class Files {
  List<Photo>? photo;

  Files({this.photo});

  Files.fromJson(Map<String, dynamic> json) {
    if (json['photo'] != null) {
      photo = <Photo>[];
      json['photo'].forEach((v) {
        photo!.add(new Photo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.photo != null) {
      data['photo'] = this.photo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photo {
  String? container;
  String? name;
  String? type;
  String? field;
  String? originalFilename;
  int? size;

  Photo(
      {this.container,
        this.name,
        this.type,
        this.field,
        this.originalFilename,
        this.size});

  Photo.fromJson(Map<String, dynamic> json) {
    container = json['container'];
    name = json['name'];
    type = json['type'];
    field = json['field'];
    originalFilename = json['originalFilename'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['container'] = this.container;
    data['name'] = this.name;
    data['type'] = this.type;
    data['field'] = this.field;
    data['originalFilename'] = this.originalFilename;
    data['size'] = this.size;
    return data;
  }
}