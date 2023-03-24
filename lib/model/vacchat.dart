class VacchatData {
  int? code;
  bool? status;
  String? message;
  List<Vacchat>? getData;

  VacchatData({this.code, this.status, this.message, this.getData});

  VacchatData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_data'] != null) {
      getData = <Vacchat>[];
      json['get_data'].forEach((v) {
        getData!.add(new Vacchat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.getData != null) {
      data['get_data'] = this.getData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vacchat {
  String? id;
  String? userId;
  String? date;
  String? vehicalNo;
  String? totalPackage;
  String? vasuliDar;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  Vacchat(
      {this.id,
        this.userId,
        this.date,
        this.vehicalNo,
        this.totalPackage,
        this.vasuliDar,
        this.createdAt,
        this.updatedAt,
        this.delStatus});

  Vacchat.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['date'] = this.date;
    data['vehical_no'] = this.vehicalNo;
    data['total_package'] = this.totalPackage;
    data['vasuli_dar'] = this.vasuliDar;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['del_status'] = this.delStatus;
    return data;
  }
}
