import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configs/configs.dart';
import '../controllers/controller.dart';
import '../models/models.dart';
import '../responsive/responsive.dart';

List<HeaderItem> headerItems = [
  HeaderItem(
    icon: Icons.home,
    onTap: () {
      Scrollable.ensureVisible(
        myScrollController.homeKey.currentContext!,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      Get.back();
    },
    text: "Home",
  ),
  HeaderItem(
    icon: Icons.person,
    onTap: () {
      Scrollable.ensureVisible(
        myScrollController.aboutKey.currentContext!,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      Get.back();
    },
    text: "About",
  ),
  HeaderItem(
    icon: Icons.work,
    onTap: () => Scrollable.ensureVisible(
      myScrollController.servicesKey.currentContext!,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    ),
    text: "Services",
  ),
  HeaderItem(
    icon: Icons.build,
    onTap: () {
      Scrollable.ensureVisible(
        myScrollController.portfolioKey.currentContext!,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      Get.back();
    },
    text: "Projects",
  ),
  HeaderItem(
    icon: Icons.settings,
    // onTap: () => openUrl(StaticUtils.appLink),
    onTap: () {
      Scrollable.ensureVisible(
        myScrollController.contactKey.currentContext!,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      Get.back();
    },
    text: "Contact",
  ),
  HeaderItem(
    icon: Icons.contact_page,
    onTap: () => openUrl(StaticUtils.resume),
    text: "Resume",
    isButton: true,
  ),
  // HeaderItem(
  //   icon: Icons.contact_page,
  //   onTap: () => openUrl(StaticUtils.appLink),
  //   text: "Our App",
  //   isButton: true,
  // ),
];
final themeController = Get.find<ThemeService>();
final myScrollController = Get.find<SccrollController>();

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Scrollable.ensureVisible(
            myScrollController.homeKey.currentContext!,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
          Get.back();
        },
        child: Image.asset(
          StaticUtils.myLogo,
          // color: Colors.red,
          height: Dimensions.height30,
          width: Dimensions.width45,
        ),
        // child: RichText(
        //     text: TextSpan(children: [
        //   TextSpan(
        //       text: "A",
        //       style: TextStyle(
        //         fontFamily: "Poppins-Medium",
        //         color: Theme.of(context).focusColor,
        //         fontWeight: FontWeight.bold,
        //         fontSize: Dimensions.font40,
        //       )),
        //   TextSpan(
        //       text: "R",
        //       style: TextStyle(
        //         fontFamily: "Poppins-Medium",
        //         color: Colors.red,
        //         fontWeight: FontWeight.bold,
        //         fontSize: Dimensions.font30,
        //       )),
        // ])),
      ),
    );
  }
}

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: Container(
        padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
        child: buildHeader(),
      ),
      mobile: buildMobileHeader(),
      tablet: buildMobileHeader(),
    );
  }

  Widget buildMobileHeader() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          GestureDetector(
            onTap: () {
              Globals.scaffoldKey.currentState!.openEndDrawer();
            },
            child: MouseRegion(
              onExit: (e) {
                setState(() {
                  _hover = false;
                });
              },
              cursor: SystemMouseCursors.click,
              onHover: (e) {
                setState(() {
                  _hover = true;
                });
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: _hover
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: themeController.isDarkOn() == true
                            ? context.theme.primaryColor
                            : Colors.white,
                      )
                    : const BoxDecoration(),
                child: Icon(Icons.menu, size: Dimensions.iconSize26),
              ),
            ),
          ),
          const HeaderLogo(),
        ]),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const HeaderLogo(),
          Row(
            children: [
              const HeaderRow(),
              SizedBox(width: Dimensions.width15),
              GetBuilder<ThemeService>(builder: (context) {
                return Switch(
                    hoverColor: Colors.white,
                    value: themeController.isDarkOn(),
                    activeColor: Colors.red,
                    onChanged: (state) {
                      themeController.switchTheme();
                    });
              }),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? Row(
            children: headerItems
                .map(
                  (item) => item.isButton
                      ? Padding(
                          padding: EdgeInsets.only(left: Dimensions.width10),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(249, 77, 30, 1),
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius8),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width20,
                                  vertical: Dimensions.height10),
                              child: TextButton(
                                onPressed: item.onTap,
                                child: Text(
                                  item.text,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimensions.font15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            margin: EdgeInsets.only(right: Dimensions.width30),
                            child: GestureDetector(
                              onTap: item.onTap,
                              child: Text(
                                item.text,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: Dimensions.font15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                )
                .toList(),
          )
        : Container();
  }
}
