import 'package:get/get.dart';

class CustomVideoPlayerController extends GetxController {
  String url = '';
  bool isVideoPlaying = false;
  void updateUrl(getUrl) {
    url = getUrl;
    update();
    print("Updated Url is $url");
  }

  void playVideo() {
    if (isVideoPlaying == true) {
      isVideoPlaying = false;
    } else {
      isVideoPlaying = true;
    }
    update();
    print("Updated Player is $isVideoPlaying");
  }
}
