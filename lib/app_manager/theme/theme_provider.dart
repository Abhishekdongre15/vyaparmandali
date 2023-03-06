
import 'package:vyaparmandali/app_manager/theme/widget_theme_data/custom_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vyaparmandali/app_manager/constant/storage_constant.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/app_manager/theme/widget_theme_data/custom_text_field_theme.dart';

enum ThemeType {
  light,
  dark
}

class ThemeProvider with ChangeNotifier {
  bool isLightTheme;
  ThemeProvider({
    this.isLightTheme=true,
  });


  static ThemeProvider of(BuildContext context)=>Provider.of<ThemeProvider>(context,listen: false);


  ThemeData get getThemeData => isLightTheme ? lightTheme() : darkTheme();
  set setThemeData(ThemeType val) {
    isLightTheme=(val==ThemeType.light);
    _storeTheme(isLightTheme);
    notifyListeners();
  }

  void _storeTheme(bool value) async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(StorageConstant.isLightTheme, value);
  }

  Future<bool> retrieveStoredTheme() async{
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(StorageConstant.isLightTheme)??true;
  }

  // bool get getSystemIsLight=>SchedulerBinding.instance.window.platformBrightness == Brightness.light;



  // define values here



  // for light theme
  static const String _fontFamily="BeVietnam";
      //"Montserrat";
  static const Color _primaryColor=AppColor.primaryColor;
  static final Color _secondaryColor=AppColor.secondaryColor;
  static const Color _backgroundColor=AppColor.backgroundColor;
  static const Color _scaffoldBackgroundColor=_backgroundColor;
  static const typeTheme = Typography.whiteMountainView;
  static  const TextTheme _textTheme=TextTheme(


  );
  static const ListTileThemeData _listTileThemeData=ListTileThemeData(
    selectedColor: _primaryColor,
  );


  static final TextButtonThemeData _textButtonThemeData=CustomButtonTheme.primary;
  static final InputDecorationTheme _inputDecorationTheme=CustomTextFieldTheme.primary;


  // for dark theme
  static const Color _primaryColorD=Colors.black54;


  static const TextSelectionThemeData _textSelectionTheme=TextSelectionThemeData(cursorColor: AppColor.black);

  static const AppBarTheme _appBarTheme=AppBarTheme(
    backgroundColor: AppColor.primaryColor,
    centerTitle: true,
    iconTheme: _iconTheme,
    titleTextStyle: TextStyle(
      color: Colors.black
    ),
    elevation: 0
  );

  static const unselectedWidgetColor=Colors.white;

  static const IconThemeData _iconTheme=IconThemeData(
      color: Colors.black
  );
  static const FloatingActionButtonThemeData _floatingActionButtonThemeData=FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor
  );

  static ThemeData lightTheme(){
    return ThemeData(
      iconTheme: _iconTheme,
      floatingActionButtonTheme: _floatingActionButtonThemeData,
      unselectedWidgetColor: unselectedWidgetColor,
      appBarTheme: _appBarTheme,
      textSelectionTheme: _textSelectionTheme,

      canvasColor: Colors.white,
      brightness: Brightness.light,
      fontFamily: _fontFamily,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: _primaryColor,
        secondary: _secondaryColor,
        brightness: Brightness.light,
        background: _backgroundColor,
      ),
      primarySwatch: generateMaterialColor(color: _primaryColor),
      primaryColor: _primaryColor,
      secondaryHeaderColor: _secondaryColor,

      textTheme:  _textTheme,
      listTileTheme: _listTileThemeData,
      scaffoldBackgroundColor: _scaffoldBackgroundColor,



      textButtonTheme: _textButtonThemeData,
      inputDecorationTheme: _inputDecorationTheme,
    );
  }



  static ThemeData darkTheme(){
    return ThemeData(
        floatingActionButtonTheme: _floatingActionButtonThemeData,
        iconTheme: _iconTheme,
        unselectedWidgetColor: unselectedWidgetColor,
        appBarTheme: _appBarTheme,
        textSelectionTheme: _textSelectionTheme,
      brightness: Brightness.dark,
      fontFamily: _fontFamily,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: _primaryColorD,
        secondary: _secondaryColor,
        brightness: Brightness.dark,
        background: _backgroundColor,
      ),
      primarySwatch: generateMaterialColor(color: _primaryColorD),
      primaryColor: _primaryColorD,
      secondaryHeaderColor: _secondaryColor,
      textTheme:  _textTheme,
      listTileTheme: _listTileThemeData,
      scaffoldBackgroundColor: _scaffoldBackgroundColor,

      textButtonTheme: _textButtonThemeData,
        inputDecorationTheme: _inputDecorationTheme
    );
  }







}










