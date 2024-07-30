import 'package:core/core.dart';
import 'package:core/flutter_bloc.dart';
import 'package:core/go_router.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../blocs/movies_cubits.dart';
import '../blocs/movies_state.dart';
import '../data/models/movie.dart';
import '../l10n/home_l10n.dart';
import 'movie_card.dart';

class MovieCarouselContainer<T extends MoviesCubit>
    extends BlocBuilder<T, MoviesState> {
  MovieCarouselContainer({
    super.key,
  }) : super(
          builder: (context, state) {
            final appTheme = AppTheme.of(context);
            final l10n = HomeL10n.of(context);
            if (state.status == MoviesStatus.error) {
              return ErrorMessage(message: l10n.fetchError);
            } else {
              return PagedListView(
                pagingController: state.pagingController,
                scrollDirection: Axis.horizontal,
                builderDelegate: PagedChildBuilderDelegate<Movie>(
                  noItemsFoundIndicatorBuilder: (context) {
                    return Center(
                      child: Text(
                        l10n.emptyList,
                        style: appTheme.theme.textTheme.titleSmall?.copyWith(
                          color: appTheme.colorScheme.primary,
                        ),
                      ),
                    );
                  },
                  newPageProgressIndicatorBuilder: (context) {
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        color: appTheme.colorScheme.tertiary[600],
                      ),
                    );
                  },
                  newPageErrorIndicatorBuilder: (context) {
                    return Center(
                      child: Text(
                        l10n.moviesFetchError,
                        style: appTheme.theme.textTheme.titleSmall?.copyWith(
                          color: appTheme.colorScheme.primary,
                        ),
                      ),
                    );
                  },
                  itemBuilder: (context, movie, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? x4 : x0,
                        right: x4,
                      ),
                      child: SizedBox(
                        width: 150,
                        child: MovieCard(
                          movie: movie,
                          onMoviePressed: (movie) {
                            context.goNamed(
                              RouteNames.movieDetail,
                              extra: movie,
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        );
}
