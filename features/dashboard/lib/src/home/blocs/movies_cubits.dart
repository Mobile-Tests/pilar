import 'package:core/core.dart';
import 'package:core/flutter_bloc.dart';

import '../data/repositories/movies_repository.dart';
import 'movies_state.dart';

abstract class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({
    required this.repository,
  }) : super(
          const MoviesState(status: MoviesStatus.loading),
        );

  final MoviesRepository repository;

  Future<void> getMovies();
}

class MoviesTrendingDayCubit extends MoviesCubit {
  MoviesTrendingDayCubit({
    required super.repository,
  });

  @override
  Future<void> getMovies() async {
    try {
      final page = state.currentPage + 1;
      final response = await repository.getTrendingDay(page: page);
      emit(state.copyWith(
        status: MoviesStatus.success,
        currentPage: page,
        totalPages: response.totalPages,
        movies: response.results,
      ));
    } catch (_) {
      emit(state.copyWith(status: MoviesStatus.error));
    }
  }
}

class MoviesTrendingDayCubitProvider
    extends BlocProvider<MoviesTrendingDayCubit> {
  MoviesTrendingDayCubitProvider({
    super.key,
    super.child,
  }) : super(create: (context) {
          return MoviesTrendingDayCubit(repository: di())..getMovies();
        });
}

class MoviesTrendingWeekCubit extends MoviesCubit {
  MoviesTrendingWeekCubit({
    required super.repository,
  });

  @override
  Future<void> getMovies() async {
    try {
      final page = state.currentPage + 1;
      final response = await repository.getTrendingWeek(page: page);
      emit(state.copyWith(
        status: MoviesStatus.success,
        currentPage: page,
        totalPages: response.totalPages,
        movies: response.results,
      ));
    } catch (_) {
      emit(state.copyWith(status: MoviesStatus.error));
    }
  }
}

class MoviesTrendingWeekCubitProvider
    extends BlocProvider<MoviesTrendingWeekCubit> {
  MoviesTrendingWeekCubitProvider({
    super.key,
    super.child,
  }) : super(
          create: (context) {
            return MoviesTrendingWeekCubit(repository: di())..getMovies();
          },
          lazy: false,
        );
}

class MoviesPopularStreamingCubit extends MoviesCubit {
  MoviesPopularStreamingCubit({
    required super.repository,
  });

  @override
  Future<void> getMovies() async {
    try {
      final page = state.currentPage + 1;
      final response = await repository.getPopularStreaming(page: page);
      emit(state.copyWith(
        status: MoviesStatus.success,
        currentPage: page,
        totalPages: response.totalPages,
        movies: response.results,
      ));
    } catch (_) {
      emit(state.copyWith(status: MoviesStatus.error));
    }
  }
}

class MoviesPopularStreamingCubitProvider
    extends BlocProvider<MoviesPopularStreamingCubit> {
  MoviesPopularStreamingCubitProvider({
    super.key,
    super.child,
  }) : super(create: (context) {
          return MoviesPopularStreamingCubit(repository: di())..getMovies();
        });
}
