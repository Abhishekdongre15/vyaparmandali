class WeightData {
  int? code;
  bool? status;
  String? message;
  List<Weight>? getData;

  WeightData({this.code, this.status, this.message, this.getData});

  WeightData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_data'] != null) {
      getData = <Weight>[];
      json['get_data'].forEach((v) {
        getData!.add( Weight.fromJson(v));
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

class Weight {
  String? id;
  String? userId;
  String? weightName;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  Weight(
      {id,
        userId,
        weightName,
        createdAt,
        updatedAt,
        delStatus});

  Weight.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    weightName = json['weight_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['weight_name'] = weightName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}
