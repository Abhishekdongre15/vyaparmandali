
// ignore: avoid_web_libraries_in_flutter
import 'package:universal_html/html.dart'   as html;


void downloadFile(String url) {
  html.AnchorElement anchorElement =   html.AnchorElement(href: url);
  anchorElement.download = url;
  anchorElement.click();
}