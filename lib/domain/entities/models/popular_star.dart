class PopularStarModel {
  final String image;
  final String title;


  PopularStarModel({
    required this.image,
    required this.title,

  });

  factory PopularStarModel.fromJson(Map<String, dynamic> json) {
    return PopularStarModel(
      image: json['image'],
      title: json['title'],
    );
  }
}