
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/component/drop_down.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/widget/responsive_screen.dart';
import 'package:vyaparmandali/model/report_link.dart';
import 'package:vyaparmandali/view_model/report_view_model.dart';

class ReportView extends StatefulWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {



  // final ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();
    get();
    // IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
    // _port.listen((dynamic data) {
    //   String id = data[0];
    //   DownloadTaskStatus status = data[1];
    //   int progress = data[2];
    //   setState((){ });
    // });

    FlutterDownloader.registerCallback((id, status, progress) {}, step: 10);
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ReportViewModel.of(context).initiate();
    });
  }


  @override
  void dispose() {
    // IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    // final SendPort? send = IsolateNameServer.lookupPortByName('downloader_send_port');
    //
    // if(send!=null){
    //   send.send([id, status, progress]);
    // }

  }


  @override
  Widget build(BuildContext context) {
    final ReportViewModel viewModel=ReportViewModel.of(context);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text("Reports"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: MyResponsiveScreen(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: Builder(
                  builder: (ctx) {
                  return Column(
                    children: [
                      Selector<ReportViewModel,ReportLink?>(
                          shouldRebuild: (prev,nex)=>true,
                          selector: (buildContext , vm)=>vm.selectedReportLink,
                          builder: (context, ReportLink? data,child) {
                          return MyDropDown<ReportLink>(
                            hint: "Select Report",
                            value: data,
                            isExpanded: true,
                            items: List.generate(ReportViewModel.links.length, (index) =>
                                DropdownMenuItem(
                                    value: ReportViewModel.links[index],
                                    child: Text(ReportViewModel.links[index].title??""))
                            ),
                            onChanged: (ReportLink? reportLinkValue){
                              viewModel.selectedReportLink=reportLinkValue;
                            },
                          );
                          }
                      ),
                      const SizedBox(height: 20,),
                      DateTimePicker(
                        firstDate: DateTime(DateTime.now().year-10, DateTime.now().month, DateTime.now().day),
                        lastDate: DateTime.now(),
                        controller: viewModel.startDateC,
                        decoration: const InputDecoration(
                          hintText: "Select Start Date",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required field !';
                          }
                          else if( viewModel.endDateC.text.isEmpty){
                            return "Please select End Date";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20,),
                      DateTimePicker(
                        firstDate: DateTime(DateTime.now().year-10, DateTime.now().month, DateTime.now().day),
                        lastDate: DateTime.now(),
                        controller: viewModel.endDateC,
                        decoration: const InputDecoration(
                          hintText: "Select End Date",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required field !';
                          }
                          else if( viewModel.startDateC.text.isEmpty){
                            return "Please select Start Date";
                          }
                          else if (DateTime.parse(value).isBefore(DateTime.parse(viewModel.startDateC.text))) {
                            return 'End date can not be less than Start Date';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20,),
                      TextButton(onPressed: (){
                        if (Form.of(ctx).validate()) {
                          viewModel.onPressDownload();
                        }
                        else {
                          Alert.show("Form is not validated");
                        }
                      }, child: const Text("Download Report"))
                    ],
                  );
                }
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
