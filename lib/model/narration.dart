class NarrationData {
  int? code;
  bool? status;
  String? message;
  List<Narration>? getData;

  NarrationData({this.code, this.status, this.message, this.getData});

  NarrationData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_data'] != null) {
      getData = <Narration>[];
      json['get_data'].forEach((v) {
        getData!.add(Narration.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (getData != null) {
      data['get_data'] = getData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Narration {
  String? id;
  String? userId;
  String? code;
  String? description;
  String? delStatus;
  String? updatedAt;
  String? createdAt;

  Narration(
      {this.id,
        this.userId,
        this.code,
        this.description,
        this.delStatus,
        this.updatedAt,
        this.createdAt});

  Narration.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    code = json['code'];
    description = json['description'];
    delStatus = json['del_status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['code'] = code;
    data['description'] = description;
    data['del_status'] = delStatus;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    return data;
  }
}
