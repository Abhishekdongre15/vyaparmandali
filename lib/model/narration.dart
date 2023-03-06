
class NarrationData {
  int? code;
  bool? status;
  String? message;
  Narration? getUserNarrationIdWiseData;
  List<Narration>? getAllData;

  NarrationData(
      {this.code,
        this.status,
        this.message,
        this.getUserNarrationIdWiseData,
        this.getAllData});

  NarrationData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    getUserNarrationIdWiseData = json['get_usergroup_id_wise_data'] != null
        ? Narration.fromJson(
        json['get_usergroup_id_wise_data'])
        : null;
    if (json['get_all_data'] != null) {
      getAllData = <Narration>[];
      json['get_all_data'].forEach((v) {
        getAllData!.add(Narration.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (getUserNarrationIdWiseData != null) {
      data['get_usergroup_id_wise_data'] =
          getUserNarrationIdWiseData!.toJson();
    }
    if (getAllData != null) {
      data['get_all_data'] = getAllData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Narration {
  String? id;
  String? code;
  String? description;
  String? delStatus;
  String? updatedAt;
  String? createdAt;

  Narration(
      {this.id,
        this.code,
        this.description,
        this.delStatus,
        this.updatedAt,
        this.createdAt});

  Narration.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    description = json['description'];
    delStatus = json['del_status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['description'] = description;
    data['del_status'] = delStatus;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    return data;
  }
}
