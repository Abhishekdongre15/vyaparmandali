




import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
import 'package:vyaparmandali/app_manager/api/api_constant.dart';
import 'package:vyaparmandali/app_manager/api/error_alert.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/service/local_storage.dart';

enum ApiType{
  get,
  post,
  rawPost,
  multiPartRequest,
  multiPartRequestPUT,
  put,
  rawPut,
  options,
  patch,
  delete,
}


Map<String,String> rawHeader={
  'Content-Type': 'application/json'
};



class ApiCallType {
  dynamic body;
  String? fileParameter;
  String? filePath;
  ApiType apiType;
  Map<String,String> header={};

  ApiCallType.get() : apiType = ApiType.get;
  ApiCallType.post({
    required this.body
  }) : apiType = ApiType.post;
  ApiCallType.rawPost({
    required this.body
  }) : apiType = ApiType.rawPost,
        header=rawHeader;

  ApiCallType.multiPartRequest({
    this.filePath,
    this.fileParameter,
    required this.body,
  }) : apiType = ApiType.multiPartRequest;

  ApiCallType.multiPartRequestPUT({
    this.filePath,
    this.fileParameter,
    required this.body,
  }) : apiType = ApiType.multiPartRequestPUT;

  ApiCallType.put({
    required this.body
  }) : apiType = ApiType.put;

  ApiCallType.rawPut({
    required this.body
  }) : apiType = ApiType.rawPut,
        header=rawHeader;

  ApiCallType.options() : apiType = ApiType.options,
        header=rawHeader;

  ApiCallType.delete() : apiType = ApiType.delete,
        header=rawHeader;

  ApiCallType.patch({
    required this.body
  }) : apiType = ApiType.patch;



}



class ApiCall {


  final LocalStorage _localStorage=LocalStorage();


  Future<dynamic> call({
    required String url,
    required ApiCallType apiCallType,
    bool showRetryEvent = false,
    bool token = false,

    String? newBaseUrl,
    bool localStorage=false,
    ValueChanged? onFoundStoredData,
    String? newToken
  }) async {

    BuildContext context=NavigationService.context!;

    if(ApiConstant.baseUrl==""){
      Alert.show("Add base url in while initiating reuse kit");
    }
    String myUrl = (newBaseUrl ?? ApiConstant.baseUrl) + url;
    String accessToken = newToken?? UserRepository.of(context).getUser.token??"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MzQ5MzB9.4wWJLSYp-6U9xHcXHXssfB_wBZCMh7vCbGr4Un-ObpA";
    // String userId = "";
    dynamic body = apiCallType.body??{};
    Map<String,String>? header = token?{
      'Authorization': accessToken.toString(),
    }:{};

    header.addAll(apiCallType.header);

    if(onFoundStoredData!=null){
      var storedData=(await _localStorage.fetchData(key: url));
      if(storedData!=null){
        onFoundStoredData(storedData);
      }

    }

    http.Response? response;
    if (kDebugMode) {
      print("Api call at ${DateTime.now()}");
      print("Type: ${apiCallType.apiType.name.toString()}");
        print("Header: $header");
      print("URL: $myUrl");
      print("BODY: $body");
    }


    try {
      switch (apiCallType.apiType) {
        case ApiType.post:

          response = await http.post(
              Uri.parse(myUrl),
              body: body,
              headers: header
          );


          break;

        case ApiType.get:
          response = await http.get(
              Uri.parse(myUrl),
              headers: header
          );
          break;

        case ApiType.rawPost:
          var request = http.Request('POST', Uri.parse(myUrl));
          request.body = json.encode(body);
          request.headers.addAll(header);
          response= await http.Response.fromStream((await request.send()));

          break;


        case ApiType.multiPartRequest:
          var request = http.MultipartRequest(
            'POST',
            Uri.parse(myUrl),
          );
          request.fields.addAll(body as Map<String,String>);
          request.headers.addAll(header);

          if (apiCallType.filePath != null && apiCallType.fileParameter!=null
          && apiCallType.filePath != "" && apiCallType.fileParameter!=""
          ) {
            request.files.add(
              http.MultipartFile(
                apiCallType.fileParameter??"",
                (File(apiCallType.filePath??"").readAsBytes().asStream()),
                File(apiCallType.filePath??"").lengthSync(),
                filename: apiCallType.filePath??"",
                contentType: MediaType(
                  'image',
                  (apiCallType.filePath??"").split(".").last,
                ),
              ),
            );
          }

          response= await http.Response.fromStream((await request.send()));
          break;

        case ApiType.multiPartRequestPUT:
          var request = http.MultipartRequest(
            'PUT',
            Uri.parse(myUrl),
          );
          request.fields.addAll(body as Map<String,String>);
          request.headers.addAll(header);

          if (apiCallType.filePath != null && apiCallType.fileParameter!=null
              && apiCallType.filePath != "" && apiCallType.fileParameter!=""
          ) {
            request.files.add(
              http.MultipartFile(
                apiCallType.fileParameter??"",
                (File(apiCallType.filePath??"").readAsBytes().asStream()),
                File(apiCallType.filePath??"").lengthSync(),
                filename: apiCallType.filePath??"",
                contentType: MediaType(
                  'image',
                  (apiCallType.filePath??"").split(".").last,
                ),
              ),
            );
          }

          response= await http.Response.fromStream((await request.send()));
          break;

        case ApiType.put:
          response = await http.put(
              Uri.parse(myUrl),
              body: body,
              headers: header
          );
          break;
        case ApiType.rawPut:
          var request = http.Request('PUT', Uri.parse(myUrl));
          request.body = json.encode(body);
          request.headers.addAll(header);
          response= await http.Response.fromStream((await request.send()));
          break;

        case ApiType.options:

          var request = http.Request('OPTIONS', Uri.parse(myUrl));
          request.body = json.encode(body);
          request.headers.addAll(header);
          response= await http.Response.fromStream((await request.send()));
          break;

        case ApiType.delete:
          var request = http.Request('DELETE', Uri.parse(myUrl));
          request.body = json.encode(body);
          request.headers.addAll(header);
          response= await http.Response.fromStream((await request.send()));
          break;
        case ApiType.patch:
          response = await http.patch(
              Uri.parse(myUrl),
              body: body,
              headers: header
          );
          break;
        default:
          break;
      }


      if (response != null) {
        var data = await _handleDecodeAndStorage(
          url: url,
          localStorage: localStorage,
          encodeData: response.body,

        );
        return data;
      }
      else {
        Alert.show("Null response");
        var storedData=(await _localStorage.fetchData(key: url));
        var errorRes=storedData??ApiConstant.cancelResponse;
        return errorRes;
      }
    }
    catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      if (showRetryEvent) {
        // ignore: use_build_context_synchronously
        var retry = await errorAlert(context, 'Alert', e.toString(),);
        if (retry) {
          var data = await call(
              url: url,
              apiCallType: apiCallType,
              showRetryEvent: showRetryEvent,
              token: token,
              newBaseUrl: newBaseUrl,
              localStorage: localStorage
          );
          return data;
        }
        else {
          var storedData=(await _localStorage.fetchData(key: url));
          var errorRes=storedData??ApiConstant.cancelResponse;
          return errorRes;
        }
      }
      else {
        var storedData=(await _localStorage.fetchData(key: url));
        var errorRes=storedData??ApiConstant.cancelResponse;
        return errorRes;
      }
    }
  }




  Future<Map> _handleDecodeAndStorage(
      {

    required String url,
    required var encodeData,
    required bool localStorage,
  }) async{
    if (kDebugMode) {
      log("Response: ${encodeData.toString()}\n");
    }
    try{
      var decodeData=(await json.decode(encodeData));


      if(decodeData['message']=="You are not authorized to access this resource."){
        Future.delayed(const Duration(seconds: 1), () {
          UserRepository.of(NavigationService.context!).directLogOut(NavigationService.context!);
          Alert.show(decodeData['message']);
        });

      }

      if(localStorage){
        _localStorage.storeData(key: url, data: decodeData);
      }
      return decodeData;
    }
    catch(e){
      var storedData=(await _localStorage.fetchData(key: url));
      var errorRes=storedData??ApiConstant.cancelResponse;
      return errorRes;
    }

  }


}