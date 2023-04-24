

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_call.dart';
import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/helper/download_file.dart';
import 'package:vyaparmandali/model/report_link.dart';

class ReportViewModel extends ChangeNotifier {

  static ReportViewModel of(BuildContext context)=>Provider.of<ReportViewModel>(context,listen: false);


  final TextEditingController startDateC= TextEditingController();
  final TextEditingController endDateC= TextEditingController();

  final ApiCall _api=ApiCall();


  static List<ReportLink> links=[
    ReportLink(
      title: "Vacchat Report",
      linkUrl: "start-end-date-wise-vacchat-report"
    ),
    ReportLink(
        title: "DhadaBook Report",
        linkUrl: "start-end-date-wise-dhadabook-report"
    ),
  ];


  ReportLink? _selectedReportLink;
  ReportLink? get selectedReportLink=>_selectedReportLink;
  set selectedReportLink(ReportLink? value){
    _selectedReportLink=value;
    notifyListeners();
  }





  void initiate(){
    _clearField();
    startDateC.text=DateTime.now().toString();
    endDateC.text=DateTime.now().toString();
    notifyListeners();
  }

  void _clearField(){
    startDateC.clear();
    endDateC.clear();
    selectedReportLink=null;
  }



  void onPressDownload(){
    if(selectedReportLink==null){
      Alert.show("Please select report to download");
    }
    else {
      downloadReport(
          urlLink: selectedReportLink?.linkUrl??"",
          startDate: startDateC.text,
          endDate: endDateC.text
      );
    }

  }



  Future<void> downloadReport({
  required String urlLink,
  required String startDate,
  required String endDate,
}) async {
    ProgressDialogue.show(message: "Fetching report url");
    try {
      var data = await _api.call(
          url: urlLink,
          apiCallType: ApiCallType.post(body: {
            "start_date": startDate,
            "end_date": endDate,
          }),
          token: true);
      ProgressDialogue.hide();
      if (data['code'] == 200 && data['status'] == true) {

        String dataUrl=data['excel_url'];

        if (kIsWeb) {
          downloadFile(dataUrl);
        } else {

            Alert.show("Downloading FIle");
            String? pathDirectory=(await getExternalStorageDirectory())?.path;

            if(pathDirectory!=null){
              await FlutterDownloader.enqueue(
                url: dataUrl,
                headers: {}, // optional: header send with url (auth token etc)
                savedDir: pathDirectory,
                showNotification: true, // show download progress in status bar (for Android)
                openFileFromNotification: true, // click on notification to open downloaded file (for Android)
              );
            }


        }



      } else {
        Alert.show(data['message']);
      }
    } catch (e) {
      ProgressDialogue.hide();
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }



}