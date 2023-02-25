



import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';



enum RowIn{
  smallScreen,
  bigScreen
}


class ResponsiveRowColumn extends StatelessWidget {
  final List<Widget> children;
  final List<int?>? rowFlex;
  final List<int?>? columnFlex;
  final RowIn rowIn;
  final double? widthDifferenceInRow;
  final double? heightDifferenceInColumn;
  final CrossAxisAlignment columnCrossAxisAlignment;
  final MainAxisAlignment columnMainAxisAlignment;

  final CrossAxisAlignment rowCrossAxisAlignment;
  final MainAxisAlignment rowMainAxisAlignment;

  const ResponsiveRowColumn({super.key,
    required this.children,
    this.rowFlex,
    this.columnFlex,
    this.rowIn=RowIn.smallScreen,
    this.widthDifferenceInRow,
    this.heightDifferenceInColumn,
    this.columnCrossAxisAlignment=CrossAxisAlignment.center,
    this.columnMainAxisAlignment=MainAxisAlignment.start,

    this.rowCrossAxisAlignment=CrossAxisAlignment.center,
    this.rowMainAxisAlignment=MainAxisAlignment.start,
  });


  @override
  Widget build(BuildContext context) {

    List<Widget> childrenWidgetsInRow=[];
    List<Widget> childrenWidgetsInColumn=[];
    for(int i=0; i<children.length; i++){

      Widget addIt=rowFlex?[i]!=null?
      Expanded(
          flex: rowFlex![i]!,
          child: children[i])
          :children[i];

      childrenWidgetsInRow.add(
          addIt
      );
      if(widthDifferenceInRow!=null && i<(children.length-1)){
        childrenWidgetsInRow.add(
            SizedBox(width: widthDifferenceInRow,)
        );
      }



      Widget addItC=columnFlex?[i]!=null?
      Expanded(
          flex: columnFlex![i]!,
          child: children[i])
          :children[i];
      childrenWidgetsInColumn.add(
          addItC
      );
      if(heightDifferenceInColumn!=null && i<(children.length-1)){
        childrenWidgetsInColumn.add(
            SizedBox(height: heightDifferenceInColumn,)
        );
      }
    }


    return LayoutBuilder(builder: (context, constraints) {
      if (Responsive.isSmallScreen(context)) {
        return
          rowIn==RowIn.smallScreen?Row(
            crossAxisAlignment: rowCrossAxisAlignment,
            mainAxisAlignment: rowMainAxisAlignment,
          children: childrenWidgetsInRow,
        ):Column(
            crossAxisAlignment: columnCrossAxisAlignment,
            mainAxisAlignment: columnMainAxisAlignment,
            children: childrenWidgetsInColumn,
          );
      } else {
        return
          rowIn==RowIn.bigScreen?Row(
            crossAxisAlignment: rowCrossAxisAlignment,
            mainAxisAlignment: rowMainAxisAlignment,
            children: childrenWidgetsInRow,
          ):Column(
            crossAxisAlignment: columnCrossAxisAlignment,
            mainAxisAlignment: columnMainAxisAlignment,
            children: childrenWidgetsInColumn,
          );
      }
    });
  }
}