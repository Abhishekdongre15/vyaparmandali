class RegisteredUserData {
  int? code;
  bool? status;
  String? message;
  List<UserData>? getAllData;

  RegisteredUserData({this.code, this.status, this.message, this.getAllData});

  RegisteredUserData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_all_data'] != null) {
      getAllData = <UserData>[];
      json['get_all_data'].forEach((v) {
        getAllData!.add(UserData.fromJson(v));
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

class UserData {
  String? id;
  String? fkUserTypeId;
  String? firstname;
  String? lastname;
  String? contactNo;
  String? email;
  String? password;
  String? country;
  String? state;
  String? city;
  String? description;
  String? profileImg;
  String? userStatus;
  String? delStatus;
  String? updatedAt;
  String? createdAt;

  UserData(
      {this.id,
        this.fkUserTypeId,
        this.firstname,
        this.lastname,
        this.contactNo,
        this.email,
        this.password,
        this.country,
        this.state,
        this.city,
        this.description,
        this.profileImg,
        this.userStatus,
        this.delStatus,
        this.updatedAt,
        this.createdAt});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fkUserTypeId = json['fk_user_type_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    contactNo = json['contact_no'];
    email = json['email'];
    password = json['password'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    description = json['description'];
    profileImg = json['profile_img'];
    userStatus = json['user_status'];
    delStatus = json['del_status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fk_user_type_id'] = fkUserTypeId;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['contact_no'] = contactNo;
    data['email'] = email;
    data['password'] = password;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['description'] = description;
    data['profile_img'] = profileImg;
    data['user_status'] = userStatus;
    data['del_status'] = delStatus;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    return data;
  }
}
