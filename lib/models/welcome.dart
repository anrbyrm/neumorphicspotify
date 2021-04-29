class Welcome {
  String title;
  String imagePath;

  Welcome({this.title, this.imagePath});

  factory Welcome.fromJson(Map<String, dynamic> json) {
    return Welcome(
      title: json["title"] as String,
      imagePath: json["image"] as String,
    );
  }
}
