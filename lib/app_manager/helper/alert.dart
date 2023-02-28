


import 'package:fluttertoast/fluttertoast.dart';

class Alert {

  static void show(message){
    Fluttertoast.showToast(
      msg: message,
        gravity: ToastGravity.CENTER
    );
  }
}