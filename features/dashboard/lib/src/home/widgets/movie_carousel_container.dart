import 'package:core/flutter_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../blocs/movies_cubits.dart';
import '../blocs/movies_state.dart';
import 'movie_card.dart';

class MovieCarouselContainer<T extends MoviesCubit>
    extends BlocBuilder<T, MoviesState> {
  MovieCarouselContainer({
    super.key,
  }) : super(
          builder: (context, state) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? x4 : x0,
                    right: x4,
                  ),
                  child: SizedBox(
                    width: 150,
                    child: MovieCard(
                      title: movie.title,
                      imageUrl: movie.imageUrl,
                      percentage: movie.percentage,
                      releaseDate: DateTime.parse(movie.releaseDate),
                    ),
                  ),
                );
              },
            );
          },
        );
}
