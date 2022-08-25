import 'package:get/instance_manager.dart';

import '../controllers/controller.dart';

class ScrollBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SccrollController());
  }
}
