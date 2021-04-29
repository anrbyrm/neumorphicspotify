class RecentlyPlayed {
  String name;
  String artist;
  String imagePath;

  RecentlyPlayed({this.name, this.artist, this.imagePath});

  factory RecentlyPlayed.fromJson(Map<String, dynamic> json) {
    return RecentlyPlayed(
      name: json["name"] as String,
      artist: json['artist'] as String,
      imagePath: json["image"] as String,
    );
  }
}
