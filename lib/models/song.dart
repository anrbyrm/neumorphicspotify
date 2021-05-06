class SongModel {
  String? name;
  String? artist;
  String? imagePath;

  SongModel({this.name, this.artist, this.imagePath});

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      name: json["name"] as String,
      artist: json['artist'] as String,
      imagePath: json["image"] as String,
    );
  }
}
