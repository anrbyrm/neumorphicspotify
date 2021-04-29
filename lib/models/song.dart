class Song {
  String name;
  String artist;
  String imagePath;

  Song({this.name, this.artist, this.imagePath});

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      name: json["name"] as String,
      artist: json['artist'] as String,
      imagePath: json["image"] as String,
    );
  }
}
