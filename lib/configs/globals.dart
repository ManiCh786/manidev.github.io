import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Globals {
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
}

void openUrl(String url) {
  try {
    launchUrl(Uri.parse(url));
  } on Exception catch (_) {
    print('never reached  the url');
  }
}
