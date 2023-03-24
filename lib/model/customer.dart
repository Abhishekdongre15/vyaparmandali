class CustomerData {
  int? code;
  bool? status;
  String? message;
  List<Customer>? getData;

  CustomerData({this.code, this.status, this.message, this.getData});

  CustomerData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_data'] != null) {
      getData = <Customer>[];
      json['get_data'].forEach((v) {
        getData!.add( Customer.fromJson(v));
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

class Customer {
  String? id;
  String? userId;
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
        userId,
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
    userId = json['user_id'];
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
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
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
