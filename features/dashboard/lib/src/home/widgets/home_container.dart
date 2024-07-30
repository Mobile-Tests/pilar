import 'package:core/flutter_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../connectivity/blocs/connectivity_cubit.dart';
import '../../search/blocs/search_bloc.dart';
import '../../search/blocs/search_events.dart';
import '../../search/blocs/search_state.dart';
import '../blocs/movies_cubits.dart';
import '../l10n/home_l10n.dart';
import 'home_screen.dart';

class HomeContainer extends Builder {
  HomeContainer({super.key})
      : super(
          builder: (context) {
            final connectivity = context.watch<ConnectivityCubit>().state;
            final searchBloc = context.watch<SearchBloc>();

            if (connectivity && searchBloc.state.status == SearchStatus.idle) {
              return HomeScreen(
                onRefresh: () async {
                  context.read<MoviesTrendingDayCubit>().onRefresh();
                  context.read<MoviesTrendingWeekCubit>().onRefresh();
                  context.read<MoviesPopularStreamingCubit>().onRefresh();
                },
                onSearch: (content) {
                  searchBloc.add(SearchContentEvent(content: content));
                },
              );
            } else if (connectivity &&
                searchBloc.state.status == SearchStatus.loading) {
              return HomeScreen(
                onRefresh: () async {
                  context.read<MoviesTrendingDayCubit>().onRefresh();
                  context.read<MoviesTrendingWeekCubit>().onRefresh();
                  context.read<MoviesPopularStreamingCubit>().onRefresh();
                },
                onSearch: (content) {
                  searchBloc.add(SearchContentEvent(content: content));
                },
                loading: true,
              );
            } else if (connectivity &&
                searchBloc.state.status == SearchStatus.error) {
              final l10n = HomeL10n.of(context);
              return ErrorMessage(message: l10n.moviesFetchError);
            } else if (connectivity &&
                searchBloc.state.status == SearchStatus.success) {
              return GestureDetector(
                onTap: () => searchBloc.add(const SearchClearEvent()),
                child: ErrorMessage(
                  message:
                      '''TODO: Search ${searchBloc.state.content}, click to go back''',
                ),
              );
            } else {
              final l10n = HomeL10n.of(context);
              return ErrorMessage(
                message: l10n.noInternet,
                onTryAgain: context.read<ConnectivityCubit>().checkConnectivity,
              );
            }
          },
        );
}
