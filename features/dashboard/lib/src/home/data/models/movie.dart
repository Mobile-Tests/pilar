import 'dart:convert';

import 'package:core/equatable.dart';

class Movie extends Equatable {
  const Movie({
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] as String,
      overview: map['overview'] as String,
      posterPath: map['poster_path'] as String,
      releaseDate: map['release_date'] as String,
      voteAverage: map['vote_average'] as double,
    );
  }

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);

  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;

  @override
  List get props => [title, overview, posterPath, releaseDate, voteAverage];
}
