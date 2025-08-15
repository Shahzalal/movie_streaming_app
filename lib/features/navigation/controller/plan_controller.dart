import 'package:get/get.dart';

class PlanController extends GetxController {
  RxString selectedPlan = "Annually".obs;

  void selectPlan(String plan) {
    selectedPlan.value = plan;
  }
}
