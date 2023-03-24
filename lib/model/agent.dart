class AgentData {
  int? code;
  bool? status;
  String? message;
  List<Agent>? getData;

  AgentData({this.code, this.status, this.message, this.getData});

  AgentData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['get_data'] != null) {
      getData = <Agent>[];
      json['get_data'].forEach((v) {
        getData!.add(Agent.fromJson(v));
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

class Agent {
  String? id;
  String? userId;
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
      {id,
        userId,
        agentCode,
        name,
        address,
        phone,
        bankName,
        branchName,
        ifscCode,
        accountNumber,
        createdAt,
        updatedAt,
        delStatus});

  Agent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
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
    data['user_id'] = userId;
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
