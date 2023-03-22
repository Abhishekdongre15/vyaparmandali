


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vyaparmandali/app_manager/api/api_constant.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';


class ManageResponse extends StatelessWidget {


  final ApiResponse response;
  final Widget child;
  final Widget? initialWidget;
  final Function? onPressRetry;
  final bool showRetryOnEmptyData;
  final bool showChildOn;
  final bool showImage;
  final Axis axis;


  const ManageResponse({Key? key, required this.response,
    required this.child,
    this.onPressRetry,
    this.showRetryOnEmptyData=true,
    this.showChildOn=false,
    this.showImage=true,  this.axis=Axis.vertical, this.initialWidget,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return getWidgetAccordingToResponse(textTheme);
  }


  Widget getWidgetAccordingToResponse(TextTheme textTheme) {


    bool showHorizontal=axis==Axis.horizontal;

    List<Widget> loadingW=[

      const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(),
      ),
      Text(response.message.toString(),
          style: textTheme.titleMedium),
    ];

    if(showChildOn){
      return child;
    }
    else {
      switch (response.status) {
        case Status.loading:
          return  Center(
            child: showHorizontal?

            Row(
              mainAxisSize: MainAxisSize.min,
              children: loadingW,
            ):Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: loadingW,
              ),
            ),
          );
        case Status.completed:
          return child;
        case Status.error:
          return _retryWidget(textTheme) ;

        case Status.empty:
          return _retryWidget(textTheme) ;
        case Status.initial:
        default:
          return  initialWidget??Container();
      }
    }

  }



  _retryWidget(TextTheme textTheme){
    List<Widget> retryW=[
      showImage?SizedBox(
          height: 100,
          child: Lottie.asset(ApiConstant.noDataFound)):Container(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: response.message.toString().contains("SocketException")?
        Text("Internet connection issue",style: textTheme.titleMedium)
            :Text(response.message.toString(),style: textTheme.titleMedium,
        maxLines: 2,),
      )
    ];
    bool showHorizontal=axis==Axis.horizontal;

    List<Widget> fullRetryW= [
      showHorizontal?
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: retryW,
        ),
      )
          :Column(
            mainAxisSize: MainAxisSize.min,
            children: retryW,
          ),
      (
          onPressRetry!=null  && (showRetryOnEmptyData || response.status!=Status.empty )
      )? Center(
        child: SizedBox(

          child: TextButton(
            onPressed: (){
              onPressRetry!();
            }, child: const Text("RETRY"),),
        ),
      ):Container()
    ];



    return Center(
      child: showHorizontal?
      Row(
        mainAxisSize: MainAxisSize.min,
        children: fullRetryW,
      )
          :Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: fullRetryW,
        ),
      ),
    );
  }

}

