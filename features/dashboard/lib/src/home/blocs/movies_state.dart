import 'package:core/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../data/models/movie.dart';

enum MoviesStatus { loading, success, error }

class MoviesState extends Equatable {
  const MoviesState({
    required this.status,
    required this.pagingController,
  });

  final MoviesStatus status;
  final PagingController<int, Movie> pagingController;

  @override
  List get props => [status, pagingController];

  MoviesState copyWith({
    MoviesStatus? status,
  }) {
    return MoviesState(
      status: status ?? this.status,
      pagingController: pagingController,
    );
  }
}
