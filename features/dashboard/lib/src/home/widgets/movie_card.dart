import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../data/models/movie.dart';
import '../l10n/home_l10n.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    this.onMoviePressed,
  });

  final Movie movie;
  final ValueChanged<Movie>? onMoviePressed;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final l10n = HomeL10n.of(context);
    return GestureDetector(
      onTap: onMoviePressed != null ? () => onMoviePressed!(movie) : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: x6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(x2),
                  child: CachedNetworkImage(
                    imageUrl: movie.imageUrl,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Positioned(
                bottom: x0,
                left: x3,
                child: Container(
                  decoration: BoxDecoration(
                    color: appTheme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: CircularPercentIndicator(
                    percent: 0.8,
                    radius: x7,
                    lineWidth: x1,
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: appTheme.colorScheme.neutral[100]!,
                    progressColor: appTheme.colorScheme.secondary,
                    center: RichText(
                      text: TextSpan(
                        text: movie.percentage.toString(),
                        style: appTheme.theme.textTheme.bodyLarge?.copyWith(
                            color: appTheme.colorScheme.backgroundContainer),
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.top,
                            child: Text(
                              '%',
                              style:
                                  appTheme.theme.textTheme.labelSmall?.copyWith(
                                color: appTheme.colorScheme.backgroundContainer,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: appTheme.theme.textTheme.titleSmall
                ?.copyWith(color: appTheme.colorScheme.primary),
          ),
          Text(
            l10n.releaseDate(DateTime.parse(movie.releaseDate)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: appTheme.theme.textTheme.labelMedium
                ?.copyWith(color: appTheme.colorScheme.neutral[500]),
          ),
        ],
      ),
    );
  }
}
