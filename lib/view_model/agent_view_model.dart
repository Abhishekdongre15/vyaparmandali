import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_call.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/helper/navigator.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/agent.dart';

class AgentViewModel extends ChangeNotifier {

  static AgentViewModel of(BuildContext context)=>Provider.of<AgentViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();

  TextEditingController agentCodeC = TextEditingController();
  TextEditingController agentNameC = TextEditingController();
  TextEditingController addressC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController bankNameC = TextEditingController();
  TextEditingController branchNameC = TextEditingController();
  TextEditingController ifscC = TextEditingController();
  TextEditingController accountNumberC = TextEditingController();



  void initiateAddAgent(){
    _clearFields();
  }



  void _clearFields() {
    agentCodeC.clear();
    agentNameC.clear();
    addressC.clear();
    phoneC.clear();
    bankNameC.clear();
    branchNameC.clear();
    ifscC.clear();
    accountNumberC.clear();
  }


  void initiateUpdateAgent(Agent thisAgent){
    _clearFields();
    agentCodeC.text=thisAgent.agentCode??"";
    agentNameC.text=thisAgent.name??"";
    addressC.text=thisAgent.address??"";
    phoneC.text=thisAgent.phone??"";
    bankNameC.text=thisAgent.bankName??"";
    branchNameC.text=thisAgent.branchName??"";
    ifscC.text=thisAgent.ifscCode??"";
    accountNumberC.text=thisAgent.accountNumber??"";
  }



  ApiResponse<AgentData> _agentDataResponse=ApiResponse<AgentData>.initial("Initial");
  ApiResponse<AgentData> get agentDataResponse=>_agentDataResponse;
  set agentDataResponse(ApiResponse<AgentData> val){
    _agentDataResponse=val;
    notifyListeners();
  }


  Future<void> fetchAgents() async {
    if((agentDataResponse.data?.getAllData??[]).isEmpty){
      agentDataResponse=ApiResponse<AgentData>.loading('Fetching Agents');
    }

    try{
      var data=await _api.call(
          url: "get-agent-master-data",
          apiCallType: ApiCallType.post(body: {
            "id": UserRepository.of(NavigationService.context!).getUser.id.toString(),
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

          }),
          token: true
      );

      if(data['code']==200 && data['status']==true){
        agentDataResponse=ApiResponse<AgentData>.completed(
            AgentData.fromJson(data)
        );
      }
      else {
        agentDataResponse=ApiResponse<AgentData>.empty("Data Not found");
      }
    }
    catch(e){
      agentDataResponse=ApiResponse<AgentData>.error(e.toString());
    }

  }




  Future<void> addAgent({
    String? id
  }) async{
    ProgressDialogue.show(message: id==null? "Adding Agent":"Updating Agent");
    try {

      Map bod={
        "agent_code": agentCodeC.text,
        "name": agentNameC.text,
        "address": addressC.text,
        "phone": phoneC.text,
        "bank_name": bankNameC.text,
        "branch_name": branchNameC.text,
        "ifsc_code": ifscC.text,
        "account_number": accountNumberC.text,
        "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

      };
      if(id!=null){
        bod['id']=id;
      }
      var data= await _api.call(
          url: id!=null? "update-agent-master-data":"add-agent-master-data",
          apiCallType: ApiCallType.post(body: bod),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        MyNavigator.pop();
        fetchAgents();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }



  Future<void> deleteAgent({
    required String id
  }) async{
    ProgressDialogue.show(message: "Deleting Agent");
    try {
      var data=await _api.call(
          url: "delete-agent-master-data",
          apiCallType: ApiCallType.post(body: {
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

            "id": id.toString(),
          }),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        fetchAgents();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }




}