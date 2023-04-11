class InWardDateData {
  int? code;
  bool? status;
  String? message;
  List<InwardDate>? inwardDatesData;

  InWardDateData({this.code, this.status, this.message, this.inwardDatesData});

  InWardDateData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['inward_dates_data'] != null) {
      inwardDatesData = <InwardDate>[];
      json['inward_dates_data'].forEach((v) {
        inwardDatesData!.add(InwardDate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (inwardDatesData != null) {
      data['inward_dates_data'] =
          inwardDatesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InwardDate {
  String? id;
  String? userId;
  String? date;
  String? vehicalNo;
  String? totalPackage;
  String? vasuliDar;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  InwardDate(
      {this.id,
        this.userId,
        this.date,
        this.vehicalNo,
        this.totalPackage,
        this.vasuliDar,
        this.createdAt,
        this.updatedAt,
        this.delStatus});

  InwardDate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    date = json['date'];
    vehicalNo = json['vehical_no'];
    totalPackage = json['total_package'];
    vasuliDar = json['vasuli_dar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['date'] = date;
    data['vehical_no'] = vehicalNo;
    data['total_package'] = totalPackage;
    data['vasuli_dar'] = vasuliDar;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}
