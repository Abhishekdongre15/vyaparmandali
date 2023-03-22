class FarmerData {
  int? code;
  bool? status;
  String? message;
  List<Farmer>? getAllData;

  FarmerData({this.code, this.status, this.message, this.getAllData});

  FarmerData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_all_data'] != null) {
      getAllData = <Farmer>[];
      json['get_all_data'].forEach((v) {
        getAllData!.add(Farmer.fromJson(v));
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

class Farmer {
  String? id;
  String? farmerName;
  String? address;
  String? city;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  Farmer(
      {this.id,
        this.farmerName,
        this.address,
        this.city,
        this.phoneNumber,
        this.createdAt,
        this.updatedAt,
        this.delStatus});

  Farmer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    farmerName = json['farmer_name'];
    address = json['address'];
    city = json['city'];
    phoneNumber = json['phone_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['farmer_name'] = farmerName;
    data['address'] = address;
    data['city'] = city;
    data['phone_number'] = phoneNumber;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}
