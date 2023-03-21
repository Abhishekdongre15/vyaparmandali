class AgentData {
  int? code;
  bool? status;
  String? message;
  List<Agent>? getAllData;

  AgentData({this.code, this.status, this.message, this.getAllData});

  AgentData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_all_data'] != null) {
      getAllData = <Agent>[];
      json['get_all_data'].forEach((v) {
        getAllData!.add(Agent.fromJson(v));
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

class Agent {
  String? id;
  String? agentCode;
  String? name;
  String? address;
  String? phone;
  String? bankName;
  String? branchName;
  String? ifscCode;
  String? accountNumber;
  String? createdAt;
  String? updatedAt;
  String? delStatus;

  Agent(
      {this.id,
        this.agentCode,
        this.name,
        this.address,
        this.phone,
        this.bankName,
        this.branchName,
        this.ifscCode,
        this.accountNumber,
        this.createdAt,
        this.updatedAt,
        this.delStatus});

  Agent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agentCode = json['agent_code'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    bankName = json['bank_name'];
    branchName = json['branch_name'];
    ifscCode = json['ifsc_code'];
    accountNumber = json['account_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['agent_code'] = agentCode;
    data['name'] = name;
    data['address'] = address;
    data['phone'] = phone;
    data['bank_name'] = bankName;
    data['branch_name'] = branchName;
    data['ifsc_code'] = ifscCode;
    data['account_number'] = accountNumber;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['del_status'] = delStatus;
    return data;
  }
}
