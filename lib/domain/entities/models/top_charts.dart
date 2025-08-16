class TopChartModel {
  final String image;
  final String title;
  final double rating;
  final String releaseYear;
  final String duration;
  final String genre;

  TopChartModel({
    required this.image,
    required this.title,
    required this.rating,
    required this.releaseYear,
    required this.duration,
    required this.genre,
  });

  factory TopChartModel.fromJson(Map<String, dynamic> json) {
    return TopChartModel(
      image: json['image'],
      title: json['title'],
      rating: (json['rating'] as num).toDouble(),
      releaseYear: json['releaseYear'],
      duration: json['duration'],
      genre: json['genre'],
    );
  }
}