
import 'package:get/get.dart';

class PlanController extends GetxController {
  String selectedPlan = "";

  void selectPlan(String plan) {
    selectedPlan = plan;
    update();
  }
}
