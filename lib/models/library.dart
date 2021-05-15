class LibraryModel {
  String? title;
  String? imagePath;
  String? author;

  int? type;
  int? songCount;

  List<Song>? songsList;

  LibraryModel(
    this.type,
    this.title,
    this.author,
    this.imagePath,
    this.songCount,
    this.songsList,
  );

  LibraryModel.fromJson(Map<String, dynamic> json) {
    type = json['type'] as int;
    author = json['author'] as String;
    title = json['title'] as String;
    imagePath = json['image'] as String;
    songCount = json['count'] as int?;
    songsList = parseSongs(json);
  }

  static List<Song> parseSongs(json) {
    var list = json['songs'] as List;
    List<Song> songsList = list.map((song) => Song.fromJson(song)).toList();
    return songsList;
  }
}

class Song {
  String? title;
  String? author;
  String? imagePath;

  Song(this.title, this.author, this.imagePath);

  Song.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String?;
    author = json['author'] as String?;
    imagePath = json['imagePath'] as String?;
  }
}
