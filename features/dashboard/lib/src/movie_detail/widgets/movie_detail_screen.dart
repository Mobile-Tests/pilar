import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../home/data/models/movie.dart';
import '../../home/l10n/home_l10n.dart';
import '../../home/widgets/movie_card.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({
    super.key,
    required this.movie,
    required this.onBackPressed,
  });

  final Movie movie;
  final VoidCallback onBackPressed;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final l10n = HomeL10n.of(context);
    return Scaffold(
      backgroundColor: appTheme.colorScheme.neutral,
      appBar: AppBar(
        backgroundColor: appTheme.colorScheme.neutral,
        centerTitle: true,
        leading: BackButton(onPressed: onBackPressed),
        title: Text(
          l10n.detail,
          style: appTheme.theme.textTheme.titleMedium,
        ),
      ),
      body: SingleLayoutScrollBuilder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(x4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieCard(movie: movie),
              const SizedBox(height: x4),
              Text(
                movie.overview,
                style: appTheme.theme.textTheme.labelLarge,
              ),
              const SizedBox(height: x4),
            ],
          ),
        );
      }),
    );
  }
}
