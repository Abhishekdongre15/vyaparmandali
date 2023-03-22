class WeightData {
  int? code;
  bool? status;
  String? message;
  List<Weight>? getAllData;

  WeightData({this.code, this.status, this.message, this.getAllData});

  WeightData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_all_data'] != null) {
      getAllData = <Weight>[];
      json['get_all_data'].forEach((v) {
        getAllData!.add(Weight.fromJson(v));
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

class Weight {
  String? id;
  String? weightName;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  Weight(
      {this.id,
        this.weightName,
        this.createdAt,
        this.updatedAt,
        this.delStatus});

  Weight.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    weightName = json['weight_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['weight_name'] = weightName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}
