class FarmerData {
  int? code;
  bool? status;
  String? message;
  List<Farmer>? getData;

  FarmerData({this.code, this.status, this.message, this.getData});

  FarmerData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_data'] != null) {
      getData = <Farmer>[];
      json['get_data'].forEach((v) {
        getData!.add(Farmer.fromJson(v));
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

class Farmer {
  String? id;
  String? userId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? address;
  String? city;
  String? phoneNumber;
  String? commissionStatus;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  Farmer(
      {this.id,
        this.userId,
        this.firstName,
        this.middleName,
        this.lastName,
        this.address,
        this.city,
        this.phoneNumber,
        this.commissionStatus,
        this.createdAt,
        this.updatedAt,
        this.delStatus});

  Farmer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    address = json['address'];
    city = json['city'];
    phoneNumber = json['phone_number'];
    commissionStatus = json['commission_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['first_name'] = firstName;
    data['middle_name'] = middleName;
    data['last_name'] = lastName;
    data['address'] = address;
    data['city'] = city;
    data['phone_number'] = phoneNumber;
    data['commission_status'] = commissionStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}
