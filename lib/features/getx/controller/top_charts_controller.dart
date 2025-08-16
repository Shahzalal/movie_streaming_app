import 'package:get/get.dart';

import '../../../domain/entities/models/top_charts.dart';
import '../../../domain/networks/top_charts_provider.dart';

class TopChartsController extends GetxController {
  final TopChartsProvider provider;
  TopChartsController(this.provider);

  List<TopChartModel> topCharts = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    loadTopCharts();
  }

  Future<void> loadTopCharts() async {
    isLoading = true;
    update();
    topCharts = await provider.fetchMovies();
    isLoading = false;
    update();
  }
}
