import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio/routes/routes.dart';

import 'configs/configs.dart';
import 'controllers/controller.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: routes,
      initialRoute: "/",
      title: StaticUtils.portFolioTitle,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
    );
  }
}
