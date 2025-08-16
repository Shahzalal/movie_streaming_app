import 'dart:async';
import 'package:movie_streaming_app/domain/entities/models/top_charts.dart';

import '../../core/utils/asset_path.dart';
import '../entities/models/movie.dart';

class TopChartsProvider {
  Future<List<TopChartModel>> fetchMovies() async {
    await Future.delayed(const Duration(seconds: 1));

    final demoData = [
      {
        "image": AssetPath.hero2Image,
        "title":'Dune',
        "rating": 8.4,
        "releaseYear": "2012",
        "duration": "2h 48m",
        "genre": "Sci-Fi"
      },
      {
        "image": AssetPath.heroImage,
        "title":"Rogue One: A Star Wars",
        "rating": 8.8,
        "releaseYear": "2012",
        "duration": "2h 28m",
        "genre": "Sci-Fi"
      },
      {
        "image": AssetPath.hero4Image,
        "title":"Suicide Squad",
        "rating": 7.8,
        "releaseYear": "2012",
        "duration": "2h 28m",
        "genre": "Sci-Fi"
      },

    ];

    return demoData.map((e) => TopChartModel.fromJson(e)).toList();
  }
}