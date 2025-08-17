class Movie {
  final String title;
  final String releaseYear;
  final String posterUrl;

  Movie({
    required this.title,
    required this.releaseYear,
    required this.posterUrl,
  });

  /// Factory constructor for JSON → Model
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? '',
      releaseYear: json['releaseYear'] ?? '',
      posterUrl: json['posterUrl'] ?? '',
    );
  }

  /// Convert Model → JSON
  Map<String, dynamic> toJson() {
    return {'title': title, 'releaseYear': releaseYear, 'posterUrl': posterUrl};
  }

  /// Mock Data
  static List<Movie> mockMovies = [
    Movie(
      title: "Avengers",
      releaseYear: "2012",
      posterUrl:
          "https://i5.walmartimages.com/asr/82524098-befa-44ee-ab49-ab2ca296a394.93447dbeff025f468fb6f7d109a37ccc.jpeg",
    ),
    Movie(
      title: "Iron Man",
      releaseYear: "2008",
      posterUrl:
          "https://m.media-amazon.com/images/M/MV5BMTczNTI2ODUwOF5BMl5BanBnXkFtZTcwMTU0NTIzMw@@._V1_FMjpg_UX1000_.jpg",
    ),
    Movie(
      title: "Spider-Man",
      releaseYear: "2002",
      posterUrl: "https://cdn.posteritati.com/posters/000/000/057/922/spiderman-md-web.jpg",
    ),
    Movie(
      title: "The Dark Knight",
      releaseYear: "2008",
      posterUrl: "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_FMjpg_UX1000_.jpg",
    ),
    Movie(
      title: "Doctor Strange",
      releaseYear: "2016",
      posterUrl: "https://m.media-amazon.com/images/I/A12-NFRep6L.jpg",
    ),
    Movie(
      title: "Captain America",
      releaseYear: "2011",
      posterUrl: "https://i.pinimg.com/736x/82/1b/80/821b8071610b751ec76dbcfcc9f88121.jpg",
    ),
  ];
}
