import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RouteButtonController extends GetxController {
  var isOnRoute = false.obs;

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
  }
}