class CashBookItemData {
  int? code;
  bool? status;
  String? message;
  List<CashBookItem>? getData;

  CashBookItemData({this.code, this.status, this.message, this.getData});

  CashBookItemData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_data'] != null) {
      getData = <CashBookItem>[];
      json['get_data'].forEach((v) {
        getData!.add( CashBookItem.fromJson(v));
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

class CashBookItem {
  String? id;
  String? userId;
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
      {id,
        userId,
        code,
        date,
        srNo,
        bankName,
        totalItem,
        gallaAmt,
        udhariAmt,
        createdAt,
        updatedAt,
        delStatus});

  CashBookItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
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
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
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
