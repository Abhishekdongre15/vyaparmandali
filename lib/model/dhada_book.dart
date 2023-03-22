class DhadaBookData {
  int? code;
  bool? status;
  String? message;
  List<DhadaBook>? getAllData;

  DhadaBookData({this.code, this.status, this.message, this.getAllData});

  DhadaBookData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_all_data'] != null) {
      getAllData = <DhadaBook>[];
      json['get_all_data'].forEach((v) {
        getAllData!.add(DhadaBook.fromJson(v));
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

class DhadaBook {
  String? id;
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
      {this.id,
        this.date,
        this.inwardDate,
        this.vehicalNo,
        this.farmerName,
        this.farmerPlace,
        this.lotNo,
        this.package,
        this.createdAt,
        this.updatedAt,
        this.delStatus});

  DhadaBook.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
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
