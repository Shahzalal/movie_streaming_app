import 'dart:async';
import '../entities/models/movie.dart';

class MovieProvider {
  Future<List<MovieModel>> fetchMovies() async {
    await Future.delayed(const Duration(seconds: 1));

    final demoData = [
      {
        "title": "Rogue One: A Star Wars Story",
        "rating": 8.8,
        "releaseYear": "2012",
        "duration": "2h 28m",
        "genre": "Sci-Fi"
      },

    ];

    return demoData.map((e) => MovieModel.fromJson(e)).toList();
  }
}
