
import 'package:get/get.dart';

class PlanController extends GetxController {
  String selectedPlan = "Annually";

  void selectPlan(String plan) {
    selectedPlan = plan;
    update();
  }
}
