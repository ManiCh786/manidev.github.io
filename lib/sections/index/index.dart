import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio/sections/sections.dart';
import '../../configs/configs.dart';
import '../../controllers/controller.dart';
import '../../responsive/responsive.dart';
import '../../widgets/widgets.dart';
import '../portfolio/portfolio.dart';
import '../services/services.dart';

class Index extends StatelessWidget {
  Index({Key? key}) : super(key: key);
  final myScrollController = Get.find<SccrollController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: !Responsive.isDesktop(context)
          ? Drawer(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width15,
                    vertical: Dimensions.height20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Divider(),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.light_mode,
                                color: context.theme.highlightColor,
                              ),
                              SizedBox(width: Dimensions.width10),
                              Text(
                                "Dark Mode \t",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: themeController.isDarkOn() == true
                                      ? Colors.white
                                      : Themes.light.iconTheme.color,
                                  fontSize: Dimensions.font15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          GetBuilder<ThemeService>(builder: (context) {
                            return Switch(
                                value: themeController.isDarkOn(),
                                activeColor: Colors.red,
                                onChanged: (state) {
                                  themeController.switchTheme();
                                });
                          }),
                        ],
                      ),
                      const Divider(),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return headerItems[index].isButton
                                ? MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            249, 77, 30, 1),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius8),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Dimensions.width26),
                                      child: TextButton(
                                        onPressed: headerItems[index].onTap,
                                        child: Text(
                                          headerItems[index].text,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.font15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: ListTile(
                                      onTap: headerItems[index].onTap,
                                      leading: Icon(
                                        color:
                                            themeController.isDarkOn() == true
                                                ? Colors.red
                                                : Colors.red,
                                        headerItems[index].icon,
                                      ),
                                      title: Text(
                                        headerItems[index].text,
                                        style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                    ),
                                  );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: Dimensions.height10);
                          },
                          itemCount: headerItems.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
      body: Column(
        children: [
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: const Header(),
          ),
          Divider(
            color: Theme.of(context).dividerColor,
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: myScrollController.scrollController,
              child: Column(
                children: [
                  Home(),
                  About(),
                  Services(),
                  Portfolio(),
                  Contact(),
                  // Developed with love in flutter text
                  Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height10),
                      child: RichText(
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.end,
                        textDirection: TextDirection.rtl,
                        softWrap: true,
                        maxLines: 1,
                        textScaleFactor: 1,
                        text: const TextSpan(
                          text: 'Developed with ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' ❤ ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red)),
                            TextSpan(
                                text: ' in ',
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: ' Flutter ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red)),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
