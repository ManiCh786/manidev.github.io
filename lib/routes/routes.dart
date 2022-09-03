import 'package:get/get.dart';

import '../bindings/bindings.dart';
import '../sections/sections.dart';

var routes = [
  GetPage(
    name: "/",
    bindings: [
      ThemeBinding(),
      ScrollBinding(),
      CustomVideoPlayerBinding(),
    ],
    page: () => Index(),
  ),
];
