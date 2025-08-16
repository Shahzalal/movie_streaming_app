import 'dart:async';
import 'package:movie_streaming_app/domain/entities/models/popular_star.dart';

import '../../core/utils/asset_path.dart';

class PopularStarProvider {
  Future<List<PopularStarModel>> fetchStar() async {
    await Future.delayed(const Duration(seconds: 1));

    final demoData = [
      {
        "image": AssetPath.actor1Image,
        "title": "Chris Evans",

      },
      {
        "image": AssetPath.actor2Image,
        "title": "Robert Downey Jr.",

      },
      {
        "image": AssetPath.actor3Image,
        "title": "Emma Watson",

      },
      {
        "image": AssetPath.actor1Image,
        "title": "Chris Evans",

      },
    ];

    return demoData.map((e) => PopularStarModel.fromJson(e)).toList();
  }
}
