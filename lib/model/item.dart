


class ItemData {
  int? code;
  bool? status;
  String? message;
  List<Item>? itemsData;

  ItemData({this.code, this.status, this.message, this.itemsData});

  ItemData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['items_data'] != null) {
      itemsData = <Item>[];
      json['items_data'].forEach((v) {
        itemsData!.add(Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (itemsData != null) {
      data['items_data'] = itemsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Item {
  String? id;
  String? fkVacchatMainId;
  String? farmerId;
  String? vacchatName;
  String? item;
  String? qty;
  String? freight;
  String? advance;
  String? vasuli;
  String? hundekariCode;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  Item(
      {this.id,
        this.fkVacchatMainId,
        this.farmerId,
        this.vacchatName,
        this.item,
        this.qty,
        this.freight,
        this.advance,
        this.vasuli,
        this.hundekariCode,
        this.createdAt,
        this.updatedAt,
        this.delStatus});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fkVacchatMainId = json['fk_vacchat_main_id'];
    farmerId = json['farmer_id'];
    vacchatName = json['vacchat_name'];
    item = json['item'];
    qty = json['qty'];
    freight = json['freight'];
    advance = json['advance'];
    vasuli = json['vasuli'];
    hundekariCode = json['hundekari_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fk_vacchat_main_id'] = fkVacchatMainId;
    data['farmer_id'] = farmerId;
    data['vacchat_name'] = vacchatName;
    data['item'] = item;
    data['qty'] = qty;
    data['freight'] = freight;
    data['advance'] = advance;
    data['vasuli'] = vasuli;
    data['hundekari_code'] = hundekariCode;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}
