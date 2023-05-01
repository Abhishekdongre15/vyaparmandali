class RojmelData {
  int? code;
  bool? status;
  String? message;
  List<Rojmel>? getData;

  RojmelData({this.code, this.status, this.message, this.getData});

  RojmelData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_data'] != null) {
      getData = <Rojmel>[];
      json['get_data'].forEach((v) {
        getData!.add( Rojmel.fromJson(v));
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

class Rojmel {
  String? id;
  String? userId;
  String? type;
  String? date;
  String? transactionType;
  String? bankId;
  String? bankName;
  String? totalBalance;
  String? pattiNumber;
  String? accountName;
  String? accountCode;
  String? amount;
  String? cheqNo;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  Rojmel(
      {id,
        userId,
        type,
        date,
        transactionType,
        bankId,
        bankName,
        totalBalance,
        pattiNumber,
        accountName,
        accountCode,
        amount,
        cheqNo,
        description,
        createdAt,
        updatedAt,
        delStatus});

  Rojmel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    date = json['date'];
    transactionType = json['transaction_type'];
    bankId = json['bank_id'];
    bankName = json['bankName'];
    totalBalance = json['total_balance'];
    pattiNumber = json['patti_number'];
    accountName = json['account_name'];
    accountCode = json['account_code'];
    amount = json['amount'];
    cheqNo = json['cheq_no'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['type'] = type;
    data['date'] = date;
    data['transaction_type'] = transactionType;
    data['bank_id'] = bankId;
    data['bankName'] = bankName;
    data['total_balance'] = totalBalance;
    data['patti_number'] = pattiNumber;
    data['account_name'] = accountName;
    data['account_code'] = accountCode;
    data['amount'] = amount;
    data['cheq_no'] = cheqNo;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}
