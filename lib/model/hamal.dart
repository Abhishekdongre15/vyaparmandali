class HamalData {
  int? code;
  bool? status;
  String? message;
  List<Hamal>? getAllData;

  HamalData({this.code, this.status, this.message, this.getAllData});

  HamalData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_data'] != null) {
      getAllData = <Hamal>[];
      json['get_data'].forEach((v) {
        getAllData!.add(Hamal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (getAllData != null) {
      data['get_data'] = getAllData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hamal {
  String? id;
  String? fkUserId;
  String? hamalName;
  String? dateOfJoining;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  Hamal(
      {id,
        fkUserId,
        hamalName,
        dateOfJoining,
        createdAt,
        updatedAt,
        delStatus});

  Hamal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fkUserId = json['fk_user_id'];
    hamalName = json['hamal_name'];
    dateOfJoining = json['date_of_joining'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fk_user_id'] = fkUserId;
    data['hamal_name'] = hamalName;
    data['date_of_joining'] = dateOfJoining;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}
