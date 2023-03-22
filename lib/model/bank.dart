class BankData {
  int? code;
  bool? status;
  String? message;
  List<Bank>? getAllData;

  BankData({this.code, this.status, this.message, this.getAllData});

  BankData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_all_data'] != null) {
      getAllData = <Bank>[];
      json['get_all_data'].forEach((v) {
        getAllData!.add(Bank.fromJson(v));
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

class Bank {
  String? id;
  String? bankName;
  String? ifscCode;
  String? branchCode;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  Bank(
      {this.id,
        this.bankName,
        this.ifscCode,
        this.branchCode,
        this.createdAt,
        this.updatedAt,
        this.delStatus});

  Bank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankName = json['bank_name'];
    ifscCode = json['ifsc_code'];
    branchCode = json['branch_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bank_name'] = bankName;
    data['ifsc_code'] = ifscCode;
    data['branch_code'] = branchCode;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}
