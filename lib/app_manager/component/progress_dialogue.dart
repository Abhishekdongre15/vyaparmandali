
import 'package:lottie/lottie.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:vyaparmandali/gen/assets.gen.dart';

late BuildContext currentContext;


class PD{


  static show({
    required String message,
  }) async{

    // factsC.updateFactCount();
    // pressController.changeValue(true);
    _showProgressDialogue(message);
  }



  static bool hide() {
    try{
      Navigator.pop(currentContext);
      return true;
    }
    catch (e){
      return false;
    }
  }


}





_showProgressDialogue(message,) async{
  BuildContext context=NavigationService.context!;
  final theme=Theme.of(context);
  return    showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext dialogContext) {
      currentContext= dialogContext;
      return WillPopScope(
        onWillPop: (){
          PD.hide();
          return Future.value(false);
        },
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              color: Colors.black54,
              child:     Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                                height: 150,
                                child: Lottie.asset(Assets.json.progressJson)),
                          ),
                          Text(message?? 'Please add a text',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.titleMedium
                          ),
                          // factsDialogue(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
        ),
      );
    },
  );
}
