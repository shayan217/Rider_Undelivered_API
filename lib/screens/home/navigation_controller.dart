import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;
  var isOffRoute = false.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  void toggleOffRoute() {
    isOffRoute.value = !isOffRoute.value;
  }
}
