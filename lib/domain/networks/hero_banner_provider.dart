import '../../core/utils/asset_path.dart';
import '../entities/models/hero_banner.dart';

class HeroBannerProvider {
  Future<List<BannerModel>> fetchBanners() async {
    await Future.delayed(const Duration(seconds: 1));

    final demoBanners = [
      {"image": AssetPath.heroImage},
    ];

    return demoBanners.map((e) => BannerModel.fromJson(e)).toList();
  }
}