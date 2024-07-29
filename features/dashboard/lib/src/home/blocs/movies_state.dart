import 'package:core/equatable.dart';

import '../data/models/movie.dart';

enum MoviesStatus { loading, success, error }

class MoviesState extends Equatable {
  const MoviesState({
    required this.status,
    this.currentPage = 0,
    this.totalPages = 0,
    this.movies = const [],
  });

  final MoviesStatus status;
  final int currentPage;
  final int totalPages;
  final List<Movie> movies;

  @override
  List get props => [status, currentPage, totalPages, movies];

  MoviesState copyWith({
    MoviesStatus? status,
    int? currentPage,
    int? totalPages,
    List<Movie>? movies,
  }) {
    return MoviesState(
      status: status ?? this.status,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      movies: movies ?? this.movies,
    );
  }
}
