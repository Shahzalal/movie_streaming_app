class MovieModel {
  final String title;
  final double rating;
  final String releaseYear;
  final String duration;
  final String genre;

  MovieModel({
    required this.title,
    required this.rating,
    required this.releaseYear,
    required this.duration,
    required this.genre,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      rating: (json['rating'] as num).toDouble(),
      releaseYear: json['releaseYear'],
      duration: json['duration'],
      genre: json['genre'],
    );
  }
}
