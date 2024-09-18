import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/features/home/presentation/view_model/entities/song/song.dart';

class SongModel {
  String title;
  String artist;
  num duration;
  Timestamp releaseDate;

  SongModel(
      {required this.title,
      required this.artist,
      required this.duration,
      required this.releaseDate});

  SongModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        artist = json['artist'],
        duration = json['duration'],
        releaseDate = json['releaseDate'];

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'artist': artist,
      'duration': duration,
      'releaseDate': releaseDate
    };
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      title: title,
        artist: artist, duration: duration, releaseDate: releaseDate);
  }
}
