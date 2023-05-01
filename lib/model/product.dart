class ProductData {
  int? code;
  bool? status;
  String? message;
  List<Product>? getData;

  ProductData({this.code, this.status, this.message, this.getData});

  ProductData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_data'] != null) {
      getData = <Product>[];
      json['get_data'].forEach((v) {
        getData!.add( Product.fromJson(v));
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

class Product {
  String? id;
  String? userId;
  String? productName;
  String? weight;
  String? rate;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  Product(
      {id,
        userId,
        productName,
        weight,
        rate,
        createdAt,
        updatedAt,
        delStatus});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productName = json['product_name'];
    weight = json['weight'];
    rate = json['rate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_name'] = productName;
    data['weight'] = weight;
    data['rate'] = rate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}
