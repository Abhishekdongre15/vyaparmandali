class DhadaBookData {
  int? code;
  bool? status;
  String? message;
  List<DhadaBook>? getData;

  DhadaBookData({this.code, this.status, this.message, this.getData});

  DhadaBookData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_data'] != null) {
      getData = <DhadaBook>[];
      json['get_data'].forEach((v) {
        getData!.add(DhadaBook.fromJson(v));
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

class DhadaBook {
  String? id;
  String? userId;
  String? date;
  String? inwardDate;
  String? vehicalNo;
  String? farmerName;
  String? farmerPlace;
  String? lotNo;
  String? package;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  DhadaBook(
      {id,
        userId,
        date,
        inwardDate,
        vehicalNo,
        farmerName,
        farmerPlace,
        lotNo,
        package,
        createdAt,
        updatedAt,
        delStatus});

  DhadaBook.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    date = json['date'];
    inwardDate = json['inward_date'];
    vehicalNo = json['vehical_no'];
    farmerName = json['farmer_name'];
    farmerPlace = json['farmer_place'];
    lotNo = json['lot_no'];
    package = json['package'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['date'] = date;
    data['inward_date'] = inwardDate;
    data['vehical_no'] = vehicalNo;
    data['farmer_name'] = farmerName;
    data['farmer_place'] = farmerPlace;
    data['lot_no'] = lotNo;
    data['package'] = package;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}
