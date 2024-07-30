import 'package:core/core.dart';
import 'package:core/go_router.dart';

import '../home/data/models/movie.dart';
import 'widgets/movie_detail_screen.dart';

class MovieDetailRoute extends GoRoute {
  MovieDetailRoute()
      : super(
          path: '/movie-detail',
          name: RouteNames.movieDetail,
          pageBuilder: (context, state) {
            final movie = state.extra as Movie?;
            return NoTransitionPage(
              name: RouteNames.movieDetail,
              child: MovieDetailScreen(
                movie: movie!,
                onBackPressed: context.pop,
              ),
            );
          },
        );
}
