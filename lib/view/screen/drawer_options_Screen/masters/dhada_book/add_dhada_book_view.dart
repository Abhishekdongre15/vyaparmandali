import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/api/manage_response.dart';
import 'package:vyaparmandali/app_manager/component/drop_down.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/dhada_book.dart';
import 'package:vyaparmandali/model/farmer.dart';
import 'package:vyaparmandali/model/inward_date.dart';
import 'package:vyaparmandali/model/item.dart';
import 'package:vyaparmandali/model/vehicle_number.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/dhada_book/widgets/dhada_book_details_widget.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/farmer/widget/farmer_selection_widget.dart';
import 'package:vyaparmandali/view_model/dhada_book_view_model.dart';
import 'package:vyaparmandali/widget/clear_selection_widget.dart';

class AddDhadaBookView extends StatefulWidget {
  final DhadaBook? dhadaBookToUpdate;
  const AddDhadaBookView({Key? key, this.dhadaBookToUpdate}) : super(key: key);

  @override
  State<AddDhadaBookView> createState() => _AddDhadaBookViewState();
}

class _AddDhadaBookViewState extends State<AddDhadaBookView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if(widget.dhadaBookToUpdate==null){
        DhadaBookViewModel.of(context).initiateAddDhadaBook();
      }
      else {
        DhadaBookViewModel.of(context).initiateUpdateDhadaBook(widget.dhadaBookToUpdate!);
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    DhadaBookViewModel viewModel=DhadaBookViewModel.of(context);
    final theme=Theme.of(context);


    Widget itemCodeWidget=Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Item",
          style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w500
          ),),
        const SizedBox(height: 5,),
        Selector<DhadaBookViewModel,Tuple2<ApiResponse<ItemData>,Item?>>(
            shouldRebuild: (prev,nex)=>true,
            selector: (buildContext , vm)=>Tuple2(vm.itemResponse, vm.selectedItem),
            builder: (context, Tuple2<ApiResponse<ItemData>,Item?> data,child) {

              ApiResponse<ItemData> response=data.item1;

              List<Item> items=response.data?.itemsData??[];



              Item? selectedItem=data.item2;
              return selectedItem!=null?

              Row(
                children: [
                  Expanded(
                    child: Text(selectedItem.item??"",
                      style: const TextStyle(
                      ),),
                  ),
                  InkWell(onTap: (){
                    viewModel.selectedItem=null;

                  }, child: const Icon(Icons.close,
                    color: AppColor.primaryColor,))
                ],
              )
                  :ManageResponse(
                response: response,
                axis: Axis.horizontal,
                showImage: false,
                initialWidget: Center(
                  child: Text("Select Vehicle Number and Inward Date",
                    style: theme.textTheme.bodySmall,),
                ),
                child: MyDropDown<Item>(
                  hint: "Select Item",
                  value: selectedItem,
                  isExpanded: true,
                  items: List.generate(items.length, (index) =>
                      DropdownMenuItem(
                          value: items[index],
                          child: Text(items[index].item??""))
                  ),
                  onChanged: (Item? selectedVal){

                    viewModel.selectedItem=selectedVal;
                  },
                ),
              );
            }
        ),
      ],
    );


    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          child: Builder(
            builder: (ctx) {
              return  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Date",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  DateTimePicker(
                    firstDate: DateTime(DateTime.now().year-10, DateTime.now().month, DateTime.now().day),
                    lastDate: DateTime.now(),
                    controller: viewModel.dateC,
                    decoration: const InputDecoration(
                      hintText: "Enter Date",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),


                  Text("Select Farmer",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  Selector<DhadaBookViewModel,Farmer?>(
                      shouldRebuild: (prev,nex)=>true,
                      selector: (buildContext , vm)=>vm.selectedFarmer,
                      builder: (context, Farmer? data,child) {
                      return data!=null?

                      ClearSelectionWidget(label: "${data.firstName??""} ${data.middleName??""} ${data.lastName??""}",
                      onTapClear: (){
                        viewModel.farmerC.clear();
                        viewModel.selectedFarmer=null;
                      },) :FarmerSelectionWidget(
                        controller: viewModel.farmerC,
                        onFarmerSelected: (Farmer? selectedFarmer) {
                          viewModel.selectedFarmer=selectedFarmer;
                      },
                      selectedFarmer: data,

                      );
                    }
                  ),
                  const SizedBox(height: 15,),




                  Text("Vehicle Number",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  Selector<DhadaBookViewModel,Tuple2<ApiResponse<VehicleNumberData>,VehicleNo?>>(
                      shouldRebuild: (prev,nex)=>true,
                      selector: (buildContext , vm)=>Tuple2(vm.vehiclesDataResponse, vm.selectedVehicleNumber),
                      builder: (context, Tuple2<ApiResponse<VehicleNumberData>,VehicleNo?> data,child) {

                        ApiResponse<VehicleNumberData> response=data.item1;

                        List<VehicleNo> vehicles=response.data?.vehicalNo??[];



                        VehicleNo? selectedVehicleNumber=data.item2;
                      return selectedVehicleNumber!=null?

                      Row(
                        children: [
                          Expanded(
                            child: Text(selectedVehicleNumber.vehicalNo??"",
                              style: const TextStyle(
                              ),),
                          ),
                          InkWell(onTap: (){
                            viewModel.selectedVehicleNumber=null;

                          }, child: const Icon(Icons.close,
                            color: AppColor.primaryColor,))
                        ],
                      )
                          :ManageResponse(
                        response: response,
                        axis: Axis.horizontal,
                        showImage: false,
                        initialWidget: Center(
                          child: Text("Select Farmer",
                          style: theme.textTheme.bodySmall,),
                        ),
                        child: MyDropDown<VehicleNo>(
                          hint: "Select Vehicle Number",
                          value: selectedVehicleNumber,
                          isExpanded: true,
                          items: List.generate(vehicles.length, (index) =>
                              DropdownMenuItem(
                                  value: vehicles[index],
                                  child: Text(vehicles[index].vehicalNo??""))
                          ),
                          onChanged: (VehicleNo? vehicleNo){

                              viewModel.selectedVehicleNumber=vehicleNo;
                          },
                        ),
                      );
                    }
                  ),
                  const SizedBox(height: 15,),



                  Text("Inward Date",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  Selector<DhadaBookViewModel,Tuple2<ApiResponse<InWardDateData>,InwardDate?>>(
                      shouldRebuild: (prev,nex)=>true,
                      selector: (buildContext , vm)=>Tuple2(vm.inwardDateDataResponse, vm.selectedInWardDate),
                      builder: (context, Tuple2<ApiResponse<InWardDateData>,InwardDate?> data,child) {

                        ApiResponse<InWardDateData> response=data.item1;

                        List<InwardDate> dates=response.data?.inwardDatesData??[];



                        InwardDate? selectedInWardDate=data.item2;
                        return selectedInWardDate!=null?

                        Row(
                          children: [
                            Expanded(
                              child: Text(selectedInWardDate.date??"",
                                style: const TextStyle(
                                ),),
                            ),
                            InkWell(onTap: (){
                              viewModel.selectedInWardDate=null;

                            }, child: const Icon(Icons.close,
                              color: AppColor.primaryColor,))
                          ],
                        )
                            :ManageResponse(
                          response: response,
                          axis: Axis.horizontal,
                          showImage: false,
                          initialWidget: Center(
                            child: Text("Select Vehicle Number",
                              style: theme.textTheme.bodySmall,),
                          ),
                          child: MyDropDown<InwardDate>(
                            hint: "Select InWard Date",
                            value: selectedInWardDate,
                            isExpanded: true,
                            items: List.generate(dates.length, (index) =>
                                DropdownMenuItem(
                                    value: dates[index],
                                    child: Text(dates[index].date??""))
                            ),
                            onChanged: (InwardDate? inwDate){

                              viewModel.selectedInWardDate=inwDate;
                            },
                          ),
                        );
                      }
                  ),
                  const SizedBox(height: 15,),


                  // Uncomment For Text field for farmer input

                  // Text("Farmer Name",
                  //   style: theme.textTheme.titleSmall?.copyWith(
                  //       fontWeight: FontWeight.w500
                  //   ),),
                  // const SizedBox(height: 5,),
                  // TextFormField(
                  //   controller: viewModel.farmerNameC,
                  //   decoration: const InputDecoration(
                  //     hintText: "Enter Farmer Name",
                  //   ),
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Required field !';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // const SizedBox(height: 15,),
                  //
                  //
                  //
                  //
                  // Text("Farmer Place",
                  //   style: theme.textTheme.titleSmall?.copyWith(
                  //       fontWeight: FontWeight.w500
                  //   ),),
                  // const SizedBox(height: 5,),
                  // TextFormField(
                  //   controller: viewModel.farmerPlaceC,
                  //   decoration: const InputDecoration(
                  //     hintText: "Enter Farmer Place",
                  //   ),
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Required field !';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // const SizedBox(height: 15,),


                  itemCodeWidget,
                  const SizedBox(height: 15,),



                  Text("Package",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    enabled: false,
                    controller: viewModel.packageC,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    decoration: const InputDecoration(
                      hintText: "Enter Package",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                   const DhadaBookDetailsWidget(),

                  const SizedBox(height: 10,),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        if (Form.of(ctx).validate()) {
                          if(viewModel.selectedFarmer?.address==null || viewModel.selectedFarmer?.firstName==null){
                            Alert.show("Select Farmer");
                          }
                          else  if(viewModel.selectedVehicleNumber==null){
                            Alert.show("Select Vehicle Number");
                          }
                          else  if(viewModel.selectedInWardDate==null){
                            Alert.show("Select InWard Date");
                          }
                          else  if(viewModel.packageDifference<0){
                            Alert.show("Distribute packages properly");
                          }
                          else {
                            viewModel.addDhadaBook(
                                id: widget.dhadaBookToUpdate?.id
                            );
                          }

                        }
                        else {
                          Alert.show("Fill all fields");
                        }
                      },
                      child:  Text(widget.dhadaBookToUpdate==null? 'Submit':"Update"),
                    ),
                  )

                ],
              );
            },
          ),
        ),
      ],
    );
  }
}