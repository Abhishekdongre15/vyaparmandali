import 'package:vyaparmandali/app_manager/helper/navigator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vyaparmandali/app_manager/api/api_constant.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';

Future<bool> errorAlert(context,alert,msg,{
  bool? showCanCelButton
}){
  var canPressOk=true;
  var retry=false;

  
  final textTheme = Theme.of(context).textTheme;

  return showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return StatefulBuilder(
            builder: (context,setState)
            {
              return Transform.scale(
                scale: a1.value,
                child: Opacity(
                  opacity: a1.value,
                  child: WillPopScope(
                    onWillPop: (){
                      return Future.value(false);
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 200,
                              child: Lottie.asset(ApiConstant.noInterNetJson),),
                            Text(msg.toString(),
                                textAlign: TextAlign.center,
                                style: textTheme.bodyMedium),
                            const SizedBox(height: 20,),
                            Row(
                              children: [
                                const Expanded(child: SizedBox()),
                                Visibility(
                                  visible: showCanCelButton?? true,
                                  child: Expanded(
                                      flex: 2,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: AppColor.greyLight,
                                        ),
                                          onPressed: (){
                                            if(canPressOk)
                                            {
                                              canPressOk=false;
                                              MyNavigator.pop();
                                              retry=false;
                                            }
                                          },
                                          child: const Text('Cancel'),)),
                                ),
                                Visibility(
                                  visible: showCanCelButton?? true,
                                  child: const Expanded(child: SizedBox()),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: TextButton(
                                        onPressed: (){
                                          if(canPressOk)
                                          {
                                            canPressOk=false;
                                            MyNavigator.pop();
                                            retry=true;
                                          }
                                        },
                                        child: const Text('Retry'),)),
                                const Expanded(child: SizedBox()),
                              ],
                            )
                            // Container(
                            //     decoration: BoxDecoration(
                            //         color: Colors.white,
                            //         borderRadius: BorderRadius.all(Radius.circular(0)),
                            //         border: Border.all(
                            //             color: Colors.red,
                            //             width: 2
                            //         )
                            //     ),
                            //     child: Column(
                            //       mainAxisAlignment: MainAxisAlignment.end,
                            //       children: [
                            //         Column(
                            //           children: [
                            //             Row(
                            //               children: [
                            //                 Expanded(
                            //                   child: Text(msg.toString(),
                            //                     textAlign: TextAlign.center,
                            //                     style: TextStyle(
                            //                         fontWeight: FontWeight.bold
                            //                     ),),
                            //                 ),
                            //                 TextButton(
                            //                   style: TextButton.styleFrom(
                            //                     primary: Colors.black,
                            //                     padding: EdgeInsets.all(8),
                            //                   ),
                            //                   onPressed: () {
                            //                     if(canPressOk)
                            //                     {
                            //                       canPressOk=false;
                            //                       MyNavigator.pop();
                            //                       retry=false;
                            //                     }
                            //                   },
                            //                   child: Text(
                            //                     'CANCEL',
                            //                     style: TextStyle(color: Colors.red,
                            //                         fontWeight: FontWeight.bold,
                            //                     fontSize: 12),
                            //                   ),
                            //                 ),
                            //
                            //                 TextButton(
                            //                   style: TextButton.styleFrom(
                            //                     primary: Colors.black,
                            //                     padding: EdgeInsets.all(8),
                            //                   ),
                            //                   onPressed: () {
                            //                     if(canPressOk)
                            //                     {
                            //                       canPressOk=false;
                            //                       MyNavigator.pop();
                            //                       retry=true;
                            //                     }
                            //                   },
                            //                   child: Text(
                            //                     'RETRY',
                            //                     style: TextStyle(color: Colors.red,
                            //                         fontWeight: FontWeight.bold,
                            //                         fontSize: 12),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ],
                            //         ),
                            //       ],
                            //     )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            });
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      }).then((val){
    canPressOk=false;
    return retry;
  });
}