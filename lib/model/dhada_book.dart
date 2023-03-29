class DhadaBookData {
  int? code;
  bool? status;
  String? message;
  List<DhadaBook>? getData;

  DhadaBookData({this.code, this.status, this.message, this.getData});

  DhadaBookData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_data'] != null) {
      getData = <DhadaBook>[];
      json['get_data'].forEach((v) {
        getData!.add(DhadaBook.fromJson(v));
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

class DhadaBook {
  String? id;
  String? userId;
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
  List<DhadabookDetails>? dhadabookDetails;

  DhadaBook(
      {this.id,
        this.userId,
        this.date,
        this.inwardDate,
        this.vehicalNo,
        this.farmerName,
        this.farmerPlace,
        this.lotNo,
        this.package,
        this.createdAt,
        this.updatedAt,
        this.delStatus,
        this.dhadabookDetails});

  DhadaBook.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
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
    if (json['dhadabook_details'] != null  && json['dhadabook_details'] != false) {
      dhadabookDetails = <DhadabookDetails>[];
      json['dhadabook_details'].forEach((v) {
        dhadabookDetails!.add(DhadabookDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
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
    if (dhadabookDetails != null) {
      data['dhadabook_details'] =
          dhadabookDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DhadabookDetails {
  String? id;
  String? fkDhadabookMainId;
  String? itemCode;
  String? name;
  String? package;
  String? gross;
  String? pB;
  String? average;
  String? rate;
  String? amount;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  DhadabookDetails(
      {this.id,
        this.fkDhadabookMainId,
        this.itemCode,
        this.name,
        this.package,
        this.gross,
        this.pB,
        this.average,
        this.rate,
        this.amount,
        this.createdAt,
        this.updatedAt,
        this.delStatus});

  DhadabookDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fkDhadabookMainId = json['fk_dhadabook_main_id'];
    itemCode = json['item_code'];
    name = json['name'];
    package = json['package'];
    gross = json['gross'];
    pB = json['p_b'];
    average = json['average'];
    rate = json['rate'];
    amount = json['amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fk_dhadabook_main_id'] = fkDhadabookMainId;
    data['item_code'] = itemCode;
    data['name'] = name;
    data['package'] = package;
    data['gross'] = gross;
    data['p_b'] = pB;
    data['average'] = average;
    data['rate'] = rate;
    data['amount'] = amount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}
