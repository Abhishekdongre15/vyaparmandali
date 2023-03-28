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
        getData!.add(Vacchat.fromJson(v));
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



class VacchatDetails {
  String? vacchatName;
  String? item;
  String? qty;
  String? freight;
  String? advance;
  String? vasuli;
  String? hundekariCode;

  VacchatDetails(
      {this.vacchatName,
        this.item,
        this.qty,
        this.freight,
        this.advance,
        this.vasuli,
        this.hundekariCode});

  VacchatDetails.fromJson(Map<String, dynamic> json) {
    vacchatName = json['vacchat_name'];
    item = json['item'];
    qty = json['qty'];
    freight = json['freight'];
    advance = json['advance'];
    vasuli = json['vasuli'];
    hundekariCode = json['hundekari_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vacchat_name'] = vacchatName;
    data['item'] = item;
    data['qty'] = qty;
    data['freight'] = freight;
    data['advance'] = advance;
    data['vasuli'] = vasuli;
    data['hundekari_code'] = hundekariCode;
    return data;
  }
}
