import 'package:get/get.dart';
import '../../../domain/entities/models/search_movies.dart';
import '../../../domain/networks/search_movie_provider.dart';


class SearchMoviesController extends GetxController {
  final MoviessProvider provider;

  SearchMoviesController(this.provider);

  List<Movie> movies = [];
  List<Movie> searchResult = [];
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
    searchResult = List.from(movies);

    isLoading = false;
    update();
  }

  void searchMovies(String query) {
    if (query.isEmpty) {
      searchResult = List.from(movies);
    } else {
      searchResult = movies
          .where((movie) =>
          movie.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    update();
  }
}

