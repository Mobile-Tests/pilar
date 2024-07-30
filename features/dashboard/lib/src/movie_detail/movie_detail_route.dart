import 'package:core/core.dart';
import 'package:core/go_router.dart';
import 'package:flutter/material.dart';

import '../home/data/models/movie.dart';

class MovieDetailRoute extends GoRoute {
  MovieDetailRoute()
      : super(
          path: '/movie-detail',
          name: RouteNames.movieDetail,
          pageBuilder: (context, state) {
            final movie = state.extra as Movie?;
            return NoTransitionPage(
              name: RouteNames.movieDetail,
              child: Material(
                child: Center(
                  child: Text('MovieDetail: ${movie?.title}'),
                ),
              ),
            );
          },
        );
}
