import 'package:flip_card/flip_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myportfolio/sections/services/widgets/service_card_back.dart';
import 'package:myportfolio/widgets/widgets.dart';

import '../../../configs/configs.dart';

class ServiceCard extends StatefulWidget {
  const ServiceCard(
      {Key? key,
      required this.serviceIcon,
      required this.serviceTitle,
      required this.serviceDescription,
      required this.cardHeight,
      required this.cardWidth})
      : super(key: key);
  final String serviceIcon;
  final String serviceTitle;
  final String serviceDescription;
  final double cardHeight;
  final double cardWidth;

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        cardKey.currentState!.toggleCard();
      },
      onHover: (isHovering) {
        if (isHovering) {
          setState(() {
            isHover = true;
          });
        } else {
          setState(() {
            isHover = false;
          });
        }
      },
      child: FlipCard(
        flipOnTouch: kIsWeb ? false : true,
        key: cardKey,
        front: cardFrontSide(),
        back: CardBackSide(isHover: isHover, widget: widget),
      ),
    );
  }

  Container cardFrontSide() {
    return Container(
      // width: Dimensions.width300,
      // height: Dimensions.height200,
      width: widget.cardWidth,
      height: widget.cardHeight,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: themeController.isDarkOn() ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: isHover
            ? [
                BoxShadow(
                  color: Theme.of(context).focusColor,
                  blurRadius: 12.0,
                  offset: const Offset(0.0, 0.0),
                )
              ]
            : [
                BoxShadow(
                  color: Colors.black.withAlpha(100),
                  blurRadius: 12.0,
                  offset: const Offset(0.0, 0.0),
                )
              ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            widget.serviceIcon,
            height: Dimensions.height45 * 2,
            color: widget.serviceIcon.contains(StaticUtils.openSource) &&
                    !themeController.isDarkOn()
                ? Colors.black
                : null,
          ),
          const SpacerY(),
          Text(
            widget.serviceTitle,
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).focusColor),
          ),
        ],
      ),
    );
  }
}

class CardBackSide extends StatelessWidget {
  const CardBackSide({
    Key? key,
    required this.isHover,
    required this.widget,
  }) : super(key: key);

  final bool isHover;
  final ServiceCard widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.width300,
      height: Dimensions.height250,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: themeController.isDarkOn() ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: isHover
            ? [
                BoxShadow(
                  color: Theme.of(context).focusColor,
                  blurRadius: 12.0,
                  offset: const Offset(0.0, 0.0),
                )
              ]
            : [
                BoxShadow(
                  color: Colors.black.withAlpha(100),
                  blurRadius: 12.0,
                  offset: const Offset(0.0, 0.0),
                )
              ],
      ),
      child: ServiceCardBackWidget(
          serviceTitle: widget.serviceTitle,
          serviceDesc: widget.serviceDescription),
    );
  }
}
