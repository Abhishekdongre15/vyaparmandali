

class CashBillData {
  int? code;
  bool? status;
  String? message;
  List<CashBill>? fetchCashBillData;

  CashBillData({this.code, this.status, this.message, this.fetchCashBillData});

  CashBillData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['fetch_cash_bill_data'] != null) {
      fetchCashBillData = <CashBill>[];
      json['fetch_cash_bill_data'].forEach((v) {
        fetchCashBillData!.add(CashBill.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (fetchCashBillData != null) {
      data['fetch_cash_bill_data'] =
          fetchCashBillData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CashBill {
  String? id;
  String? userId;
  String? productName;
  String? weight;
  String? rate;
  String? aPMCCharges;
  String? commission;
  String? finalPrice;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  CashBill(
      {this.id,
        this.userId,
        this.productName,
        this.weight,
        this.rate,
        this.aPMCCharges,
        this.commission,
        this.finalPrice,
        this.createdAt,
        this.updatedAt,
        this.delStatus});

  CashBill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productName = json['product_name'];
    weight = json['weight'];
    rate = json['rate'];
    aPMCCharges = json['APMC_charges'];
    commission = json['commission'];
    finalPrice = json['final_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_name'] = productName;
    data['weight'] = weight;
    data['rate'] = rate;
    data['APMC_charges'] = aPMCCharges;
    data['commission'] = commission;
    data['final_price'] = finalPrice;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}

