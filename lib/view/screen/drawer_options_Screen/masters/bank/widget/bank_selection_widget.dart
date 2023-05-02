
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/api/manage_response.dart';
import 'package:vyaparmandali/app_manager/component/drop_down.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/bank.dart';
import 'package:vyaparmandali/view_model/bank_view_model.dart';

class BankSelectionWidget extends StatefulWidget {
  final ValueChanged<Bank?> onBankSelected;
  final Bank? selectedBank;


  const BankSelectionWidget({Key? key, required this.onBankSelected, this.selectedBank,}) : super(key: key);

  @override
  State<BankSelectionWidget> createState() => _BankSelectionWidgetState();
}

class _BankSelectionWidgetState extends State<BankSelectionWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  get() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      BankViewModel.of(NavigationService.context!).fetchBanks();
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Selector<BankViewModel,ApiResponse<BankData>>(
              shouldRebuild: (prev,nex)=>true,
              selector: (buildContext , vm)=>vm.bankDataResponse,
              builder: (context,ApiResponse<BankData> data,child) {

                ApiResponse<BankData> response=data;
                List<Bank> banks = (response.data??BankData()).getData??[];

                return  ManageResponse(
                  response: response,
                  axis: Axis.horizontal,
                  child: MyDropDown<Bank>(
                    hint: "Select Bank",
                    value: widget.selectedBank,
                    onChanged: (Bank? selectedBank){
                      widget.onBankSelected(selectedBank);
                    },
                    items: banks.map((e) =>
                        DropdownMenuItem<Bank>(
                          value: e,
                          child: Text(e.bankName??""),)
                    ).toList(),
                  ),
                );
              }
          ),
        ),

        Tooltip(
          message: "Add Bank",
          child: IconButton(

              onPressed: (){
                BankViewModel().onPressAddBank();
              }, icon: const Icon(Icons.add,color: AppColor.primaryColor,)),
        )

      ],
    );
  }
}