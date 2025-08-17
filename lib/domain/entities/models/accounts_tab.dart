class AccountModel {
  List<String> favoriteMovies;
  List<String> downloads;
  List<String> selectedGenres;
  bool isSubscribed;

  AccountModel({
    required this.favoriteMovies,
    required this.downloads,
    required this.selectedGenres,
    required this.isSubscribed,
  });

  /// factory method: default data
  factory AccountModel.initial() {
    return AccountModel(
      favoriteMovies: ["Inception", "Interstellar", "Avengers"],
      downloads: ["Dark Knight", "Joker"],
      selectedGenres: ["Action", "Sci-Fi"],
      isSubscribed: false,
    );
  }

  AccountModel copyWith({
    List<String>? favoriteMovies,
    List<String>? downloads,
    List<String>? selectedGenres,
    bool? isSubscribed,
  }) {
    return AccountModel(
      favoriteMovies: favoriteMovies ?? this.favoriteMovies,
      downloads: downloads ?? this.downloads,
      selectedGenres: selectedGenres ?? this.selectedGenres,
      isSubscribed: isSubscribed ?? this.isSubscribed,
    );
  }
}
