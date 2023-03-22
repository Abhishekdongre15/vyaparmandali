class CashBookItemData {
  int? code;
  bool? status;
  String? message;
  List<CashBookItem>? getAllData;

  CashBookItemData({this.code, this.status, this.message, this.getAllData});

  CashBookItemData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_all_data'] != null) {
      getAllData = <CashBookItem>[];
      json['get_all_data'].forEach((v) {
        getAllData!.add(CashBookItem.fromJson(v));
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

class CashBookItem {
  String? id;
  String? code;
  String? date;
  String? srNo;
  String? bankName;
  String? totalItem;
  String? gallaAmt;
  String? udhariAmt;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  CashBookItem(
      {this.id,
        this.code,
        this.date,
        this.srNo,
        this.bankName,
        this.totalItem,
        this.gallaAmt,
        this.udhariAmt,
        this.createdAt,
        this.updatedAt,
        this.delStatus});

  CashBookItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    date = json['date'];
    srNo = json['sr_no'];
    bankName = json['bank_name'];
    totalItem = json['total_item'];
    gallaAmt = json['galla_amt'];
    udhariAmt = json['udhari_amt'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['date'] = date;
    data['sr_no'] = srNo;
    data['bank_name'] = bankName;
    data['total_item'] = totalItem;
    data['galla_amt'] = gallaAmt;
    data['udhari_amt'] = udhariAmt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}
