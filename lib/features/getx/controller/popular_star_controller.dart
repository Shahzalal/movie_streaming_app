import 'package:get/get.dart';
import '../../../domain/entities/models/popular_star.dart';
import '../../../domain/networks/popular_star_provider.dart';


class PopularStarController extends GetxController {
  final PopularStarProvider provider;

  PopularStarController(this.provider);

  List<PopularStarModel> stars = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    loadStars();
  }

  Future<void> loadStars() async {
    isLoading = true;
    update();

    stars = await provider.fetchStar();

    isLoading = false;
    update();
  }
}
