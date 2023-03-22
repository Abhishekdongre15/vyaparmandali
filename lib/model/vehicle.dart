class VehicleData {
  int? code;
  bool? status;
  String? message;
  List<Vehicle>? getAllData;

  VehicleData({this.code, this.status, this.message, this.getAllData});

  VehicleData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_all_data'] != null) {
      getAllData = <Vehicle>[];
      json['get_all_data'].forEach((v) {
        getAllData!.add(Vehicle.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (getAllData != null) {
      data['get_all_data'] = getAllData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vehicle {
  String? id;
  String? ownerName;
  String? vehicalName;
  String? vehicalNumber;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  Vehicle(
      {this.id,
        this.ownerName,
        this.vehicalName,
        this.vehicalNumber,
        this.createdAt,
        this.updatedAt,
        this.delStatus});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerName = json['owner_name'];
    vehicalName = json['vehical_name'];
    vehicalNumber = json['vehical_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['owner_name'] = ownerName;
    data['vehical_name'] = vehicalName;
    data['vehical_number'] = vehicalNumber;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}
