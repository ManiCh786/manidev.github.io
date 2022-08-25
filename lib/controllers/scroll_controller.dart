import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SccrollController extends GetxController {
  ScrollController scrollController = ScrollController();
  GlobalKey homeKey = GlobalKey();
  GlobalKey aboutKey = GlobalKey();
  GlobalKey portfolioKey = GlobalKey();
  GlobalKey servicesKey = GlobalKey();
  GlobalKey contactKey = GlobalKey();
}
