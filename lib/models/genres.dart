class GenresModel {
  String? color;
  String? title;
  String? image;

  GenresModel({this.color, this.title, this.image});

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      color: json["color"] as String,
      title: json["title"] as String,
      image: json["image"] as String,
    );
  }
}
