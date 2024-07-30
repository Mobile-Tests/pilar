import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../home/data/models/movie.dart';
import '../../home/l10n/home_l10n.dart';
import 'movie_detail_screen.dart';

class MovieDetailContainer extends StatelessWidget {
  const MovieDetailContainer({
    super.key,
    required this.movie,
    required this.onBackPressed,
  });

  final Movie? movie;
  final VoidCallback onBackPressed;

  @override
  Widget build(BuildContext context) {
    if (movie == null) {
      final l10n = HomeL10n.of(context);
      return ErrorMessage(message: l10n.movieDetailRouteError);
    } else {
      return MovieDetailScreen(
        movie: movie!,
        onBackPressed: onBackPressed,
      );
    }
  }
}
