class VehicleData {
  int? code;
  bool? status;
  String? message;
  List<Vehicle>? getData;

  VehicleData({this.code, this.status, this.message, this.getData});

  VehicleData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_data'] != null) {
      getData = <Vehicle>[];
      json['get_data'].forEach((v) {
        getData!.add( Vehicle.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (getData != null) {
      data['get_data'] = getData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vehicle {
  String? id;
  String? userId;
  String? ownerName;
  String? vehicalName;
  String? vehicalNumber;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  Vehicle(
      {id,
        userId,
        ownerName,
        vehicalName,
        vehicalNumber,
        createdAt,
        updatedAt,
        delStatus});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    ownerName = json['owner_name'];
    vehicalName = json['vehical_name'];
    vehicalNumber = json['vehical_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['owner_name'] = ownerName;
    data['vehical_name'] = vehicalName;
    data['vehical_number'] = vehicalNumber;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}
