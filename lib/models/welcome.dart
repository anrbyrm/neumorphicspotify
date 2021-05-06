class WelcomeModel {
  String? title;
  String? imagePath;

  WelcomeModel({this.title, this.imagePath});

  factory WelcomeModel.fromJson(Map<String, dynamic> json) {
    return WelcomeModel(
      title: json["title"] as String,
      imagePath: json["image"] as String,
    );
  }
}
