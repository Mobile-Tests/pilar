import 'package:core/core.dart';
import 'package:core/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../data/repositories/movies_repository.dart';
import 'movies_state.dart';

abstract class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({
    required this.repository,
  }) : super(MoviesState(
          status: MoviesStatus.loading,
          pagingController: PagingController(firstPageKey: 1),
        )) {
    state.pagingController.addPageRequestListener(_getMovies);
    _getMovies(1);
  }

  final MoviesRepository repository;

  Future<void> _getMovies(int pageKey);

  @override
  Future<void> close() {
    state.pagingController.dispose();
    return super.close();
  }
}

class MoviesTrendingDayCubit extends MoviesCubit {
  MoviesTrendingDayCubit({
    required super.repository,
  });

  @override
  Future<void> _getMovies(int pageKey) async {
    try {
      final response = await repository.getTrendingDay(page: pageKey);
      final isLastPage = response.page == response.totalPages;

      if (isLastPage) {
        state.pagingController.appendLastPage(response.results);
      } else {
        pageKey++;
        state.pagingController.appendPage(response.results, pageKey);
      }

      emit(state.copyWith(status: MoviesStatus.success));
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
          return MoviesTrendingDayCubit(repository: di());
        });
}

class MoviesTrendingWeekCubit extends MoviesCubit {
  MoviesTrendingWeekCubit({
    required super.repository,
  });

  @override
  Future<void> _getMovies(int pageKey) async {
    try {
      final response = await repository.getTrendingWeek(page: pageKey);
      final isLastPage = response.page == response.totalPages;

      if (isLastPage) {
        state.pagingController.appendLastPage(response.results);
      } else {
        pageKey++;
        state.pagingController.appendPage(response.results, pageKey);
      }

      emit(state.copyWith(status: MoviesStatus.success));
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
            return MoviesTrendingWeekCubit(repository: di());
          },
          lazy: false,
        );
}

class MoviesPopularStreamingCubit extends MoviesCubit {
  MoviesPopularStreamingCubit({
    required super.repository,
  });

  @override
  Future<void> _getMovies(int pageKey) async {
    try {
      final response = await repository.getPopularStreaming(page: pageKey);
      final isLastPage = response.page == response.totalPages;

      if (isLastPage) {
        state.pagingController.appendLastPage(response.results);
      } else {
        pageKey++;
        state.pagingController.appendPage(response.results, pageKey);
      }

      emit(state.copyWith(status: MoviesStatus.success));
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
          return MoviesPopularStreamingCubit(repository: di());
        });
}
