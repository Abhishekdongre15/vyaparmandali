class CustomerData {
  int? code;
  bool? status;
  String? message;
  List<Customer>? getAllData;

  CustomerData({this.code, this.status, this.message, this.getAllData});

  CustomerData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_all_data'] != null) {
      getAllData = <Customer>[];
      json['get_all_data'].forEach((v) {
        getAllData!.add(Customer.fromJson(v));
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

class Customer {
  String? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? city;
  String? district;
  String? state;
  String? address;
  String? email;
  String? contactNo;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  Customer(
      {id,
        firstName,
        middleName,
        lastName,
        city,
        district,
        state,
        address,
        email,
        contactNo,
        createdAt,
        updatedAt,
        delStatus});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    city = json['city'];
    district = json['district'];
    state = json['state'];
    address = json['address'];
    email = json['email'];
    contactNo = json['contact_no'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['middle_name'] = middleName;
    data['last_name'] = lastName;
    data['city'] = city;
    data['district'] = district;
    data['state'] = state;
    data['address'] = address;
    data['email'] = email;
    data['contact_no'] = contactNo;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}
