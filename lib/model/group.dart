class GroupData {
  int? code;
  bool? status;
  String? message;
  Group? getUserGroupIdWiseData;
  List<Group>? getAllData;

  GroupData(
      {this.code,
        this.status,
        this.message,
        this.getUserGroupIdWiseData,
        this.getAllData});

  GroupData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    getUserGroupIdWiseData = json['get_usergroup_id_wise_data'] != null
        ? Group.fromJson(
        json['get_usergroup_id_wise_data'])
        : null;
    if (json['get_all_data'] != null) {
      getAllData = <Group>[];
      json['get_all_data'].forEach((v) {
        getAllData!.add(Group.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (getUserGroupIdWiseData != null) {
      data['get_usergroup_id_wise_data'] =
          getUserGroupIdWiseData!.toJson();
    }
    if (getAllData != null) {
      data['get_all_data'] = getAllData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Group {
  String? id;
  String? code;
  String? name;
  String? delStatus;
  String? updatedAt;
  String? createdAt;

  Group(
      {this.id,
        this.code,
        this.name,
        this.delStatus,
        this.updatedAt,
        this.createdAt});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    delStatus = json['del_status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['del_status'] = delStatus;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    return data;
  }
}
