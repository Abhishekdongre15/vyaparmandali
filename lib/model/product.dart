class ProductData {
  int? code;
  bool? status;
  String? message;
  List<Product>? getAllData;

  ProductData({this.code, this.status, this.message, this.getAllData});

  ProductData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_all_data'] != null) {
      getAllData = <Product>[];
      json['get_all_data'].forEach((v) {
        getAllData!.add(Product.fromJson(v));
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

class Product {
  String? id;
  String? productName;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  Product(
      {this.id,
        this.productName,
        this.createdAt,
        this.updatedAt,
        this.delStatus});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_name'] = productName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}
