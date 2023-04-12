import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchable_text_field/searchable_text_field.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/customer.dart';
import 'package:vyaparmandali/view_model/customer_view_model.dart';

class CustomerSelectionWidget extends StatelessWidget {
  final ValueChanged<Customer?> onCustomerSelected;
  final Customer? selectedCustomer;
  final TextEditingController controller;


  const CustomerSelectionWidget({Key? key, required this.onCustomerSelected, this.selectedCustomer, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Selector<CustomerViewModel,ApiResponse<List<Customer>>>(
              shouldRebuild: (prev,nex)=>true,
              selector: (buildContext , vm)=>vm.searchedCustomerResponse,
              builder: (context, ApiResponse<List<Customer>> data,child) {
                List<Customer> customers=data.data??[];

                SearchableTextFieldStatus status=
                controller.text.trim().isEmpty?
                SearchableTextFieldStatus.none :
                selectedCustomer!=null?
                SearchableTextFieldStatus.itemSelected :
                data.status==Status.loading?
                SearchableTextFieldStatus.loading :
                customers.isEmpty?
                SearchableTextFieldStatus.noItemFound :
                customers.isNotEmpty?
                SearchableTextFieldStatus.itemFound :
                SearchableTextFieldStatus.none;

                return  SearchableTextField<Customer>(
                  controller: controller,
                  status: status,
                  decoration: const InputDecoration(
                    hintText: "Search Customer Here",
                  ),
                  noItemWidget: const Center(child: Text("No Customer Found")),
                  onChanged: (val) {
                    if(val!=null){
                      onCustomerSelected(null);
                      CustomerViewModel.of(context).fetchCustomerByName(customerName: val);
                    }
                  },
                  onSelectedItem: (Customer selectedCustomer){
                    onCustomerSelected(selectedCustomer);
                    CustomerViewModel.of(context).searchedCustomerResponse=ApiResponse<List<Customer>>.initial("");
                  },
                  validator: (val) {
                    if(val==null || val.toString().isEmpty){
                      return "Required Field !!";
                    }
                    else if(selectedCustomer==null){
                      return "Please Select Customer";
                    }
                    else {
                      return null;
                    }
                  },
                  items: customers.map((e) =>
                      SearchableItem<Customer>(
                          value: e,
                          title: "${e.firstName??""} ${e.middleName??""} ${e.lastName??""}",)
                  ).toList(),
                );
              }
          ),
        ),
        
        Tooltip(
          message: "Add Customer",
          child: IconButton(
              onPressed: (){
                CustomerViewModel.onPressAddCustomer();
          }, icon: const Icon(Icons.add,color: AppColor.primaryColor,)),
        )
        
      ],
    );
  }
}
