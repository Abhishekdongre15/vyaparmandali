

import 'package:vyaparmandali/gen/assets.gen.dart';

class ApiConstant {
  static String baseUrl = "https://softonauts.in/vyapar/";
  static const Map cancelResponse = {
    'responseCode': 0,
    'message': 'Try Again...'
  };
  static String noInterNetJson = Assets.json.noInternetJson;
  static String progressJson = Assets.json.progressJson;
  static String noDataFound = Assets.json.noDataFound;
}
