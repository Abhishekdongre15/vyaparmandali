class HamalData {
  int? code;
  bool? status;
  String? message;
  Hamal? getHamalMasterIdWiseData;
  List<Hamal>? getAllData;

  HamalData(
      {this.code,
        this.status,
        this.message,
        this.getHamalMasterIdWiseData,
        this.getAllData});

  HamalData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    getHamalMasterIdWiseData = json['get_hamal_master_id_wise_data'] != null
        ? Hamal.fromJson(
        json['get_hamal_master_id_wise_data'])
        : null;
    if (json['get_all_data'] != null) {
      getAllData = <Hamal>[];
      json['get_all_data'].forEach((v) {
        getAllData!.add(Hamal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (getHamalMasterIdWiseData != null) {
      data['get_hamal_master_id_wise_data'] =
          getHamalMasterIdWiseData!.toJson();
    }
    if (getAllData != null) {
      data['get_all_data'] = getAllData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hamal {
  String? id;
  String? hamalName;
  String? dateOfJoining;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  Hamal(
      {this.id,
        this.hamalName,
        this.dateOfJoining,
        this.createdAt,
        this.updatedAt,
        this.delStatus});

  Hamal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hamalName = json['hamal_name'];
    dateOfJoining = json['date_of_joining'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['hamal_name'] = hamalName;
    data['date_of_joining'] = dateOfJoining;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}
