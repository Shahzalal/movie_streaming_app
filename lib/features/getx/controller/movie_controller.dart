import 'package:get/get.dart';
import '../../../domain/entities/models/hero_banner.dart';
import '../../../domain/entities/models/movie.dart';
import '../../../domain/networks/hero_banner_provider.dart';
import '../../../domain/networks/movie_provider.dart';


class MovieController extends GetxController {
  final MovieProvider provider;
  MovieController(this.provider);

  List<MovieModel> movies = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    loadMovies();
  }

  Future<void> loadMovies() async {
    isLoading = true;
    update();
    movies = await provider.fetchMovies();
    isLoading = false;
    update();
  }
}

class BannerController extends GetxController {
  final HeroBannerProvider bannerProvider;
  BannerController(this.bannerProvider);

  List<BannerModel> banners = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    loadBanners();
  }

  Future<void> loadBanners() async {
    isLoading = true;
    update();
    banners = await bannerProvider.fetchBanners();
    isLoading = false;
    update();
  }
}

