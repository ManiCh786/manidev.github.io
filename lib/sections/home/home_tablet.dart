import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../animations/animations.dart';
import '../../configs/configs.dart';
import '../../widgets/widgets.dart';

class HomeTablet extends StatelessWidget {
  const HomeTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 1.02,
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Opacity(
              opacity: 0.9,
              child: EntranceFader(
                offset: const Offset(0, 0),
                delay: const Duration(seconds: 1),
                duration: const Duration(milliseconds: 800),
                child: SvgPicture.asset(
                  StaticUtils.maniwhitebg,
                  height: size.width < 1200
                      ? size.height * 0.75
                      : size.height * 0.85,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: Dimensions.width15,
            child: Container(
              margin: const EdgeInsets.fromLTRB(30, 100, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'WELCOME TO MY PORTFOLIO! ',
                        style: TextStyle(
                          fontSize: Dimensions.font30,
                          fontWeight: FontWeight.w200,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      EntranceFader(
                        offset: const Offset(0, 0),
                        delay: const Duration(seconds: 2),
                        duration: const Duration(milliseconds: 800),
                        child: Image.asset(StaticUtils.hi,
                            height: Dimensions.height30),
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.height30),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "Abdur ",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: Dimensions.font60,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).focusColor,
                      ),
                    ),
                    TextSpan(
                      text: "Rehman ",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: Dimensions.font70,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).focusColor,
                      ),
                    ),
                  ])),
                  SizedBox(height: Dimensions.height15),
                  EntranceFader(
                    offset: const Offset(-10, 0),
                    delay: const Duration(seconds: 1),
                    duration: const Duration(milliseconds: 800),
                    child: Row(
                      children: [
                        Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.red,
                          size: Dimensions.iconSize30,
                        ),
                        AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            TyperAnimatedText(
                              ' Flutter Developer',
                              textStyle: TextStyle(
                                color: Theme.of(context).focusColor,
                                fontSize: Dimensions.font26,
                              ),
                              speed: const Duration(milliseconds: 50),
                            ),
                            TyperAnimatedText(
                              ' PHP Developer',
                              textStyle: TextStyle(
                                color: Theme.of(context).focusColor,
                                fontSize: Dimensions.font26,
                              ),
                              speed: const Duration(milliseconds: 50),
                            ),
                            TyperAnimatedText(
                              ' UI/UX Enthusiast',
                              textStyle: TextStyle(
                                color: Theme.of(context).focusColor,
                                fontSize: Dimensions.font26,
                              ),
                              speed: const Duration(milliseconds: 50),
                            ),
                            TyperAnimatedText(
                              ' A friend :)',
                              textStyle: TextStyle(
                                color: Theme.of(context).focusColor,
                                fontSize: Dimensions.font26,
                              ),
                              speed: const Duration(milliseconds: 50),
                            ),
                          ],
                          isRepeatingAnimation: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.height30),
                  const HomeIconButtonsRow(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
