import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../configs/configs.dart';
import '../../../widgets/widgets.dart';

class ServiceCardBackWidget extends StatelessWidget {
  const ServiceCardBackWidget(
      {Key? key, required this.serviceDesc, required this.serviceTitle})
      : super(key: key);

  final String serviceDesc;
  final String serviceTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTitleText(
            title: serviceDesc,
            fontWeight: FontWeight.w100,
            fontSize: Dimensions.font15,
            textColor: Theme.of(context).focusColor),
        Divider(
          color: themeController.isDarkOn() ? Colors.white : Colors.black38,
        ),
        SizedBox(
          height: Dimensions.height45,
          width: Dimensions.width100 + Dimensions.width30,
          child: MaterialButton(
            color: Colors.red,
            onPressed: () => contactDialogue(context),
            child: CustomTitleText(
              title: "Hire Me",
              fontWeight: FontWeight.w100,
              fontSize: Dimensions.font20,
              textColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> contactDialogue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: CustomTitleText(
                title: "Hire Me",
                fontWeight: FontWeight.w100,
                fontSize: Dimensions.font26,
                textColor: Colors.white,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Back"),
                )
              ],
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    height: Dimensions.height10 + Dimensions.height30,
                    onPressed: () {},
                    color: const Color(0xff34CB62),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.white,
                        ),
                        const SpacerX(),
                        TextButton(
                          child: CustomTitleText(
                            title: "WhatsApp",
                            fontWeight: FontWeight.w100,
                            fontSize: Dimensions.font26,
                            textColor: Colors.white,
                          ),
                          onPressed: () =>
                              openUrl(StaticUtils.whatsappProfileLink),
                        ),
                      ],
                    ),
                  ),
                  const SpacerY(),
                  MaterialButton(
                    height: Dimensions.height10 + Dimensions.height30,
                    onPressed: () {},
                    color: const Color(0xff13A800),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          'https://img.icons8.com/ios-filled/50/000000/fiverr.png',
                          height: 35.0,
                          color: Colors.white,
                        ),
                        const SpacerX(),
                        TextButton(
                          child: CustomTitleText(
                            title: "Fiverr",
                            fontWeight: FontWeight.w100,
                            fontSize: Dimensions.font26,
                            textColor: Colors.white,
                          ),
                          onPressed: () => openUrl(StaticUtils.fiverrGigLink),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
