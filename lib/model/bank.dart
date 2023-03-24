class BankData {
  int? code;
  bool? status;
  String? message;
  List<Bank>? getData;

  BankData({this.code, this.status, this.message, this.getData});

  BankData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_data'] != null) {
      getData = <Bank>[];
      json['get_data'].forEach((v) {
        getData!.add(new Bank.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (getData != null) {
      data['get_data'] = getData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bank {
  String? id;
  String? userId;
  String? bankName;
  String? ifscCode;
  String? branchCode;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  Bank(
      {id,
        userId,
        bankName,
        ifscCode,
        branchCode,
        createdAt,
        updatedAt,
        delStatus});

  Bank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    bankName = json['bank_name'];
    ifscCode = json['ifsc_code'];
    branchCode = json['branch_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['bank_name'] = bankName;
    data['ifsc_code'] = ifscCode;
    data['branch_code'] = branchCode;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}
