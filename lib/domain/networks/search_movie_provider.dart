import 'dart:async';
import '../entities/models/search_movies.dart';

class MoviessProvider {
  Future<List<Movie>> fetchMovies() async {
    await Future.delayed(const Duration(seconds: 1));

    return Movie.mockMovies;
  }
}
