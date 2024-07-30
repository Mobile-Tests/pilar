import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter/services.dart';

import '../blocs/movies_cubits.dart';
import '../l10n/home_l10n.dart';
import 'movie_carousel_container.dart';
import 'movie_topic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.onRefresh,
    required this.onSearch,
    this.loading = false,
  });

  final AsyncCallback onRefresh;
  final ValueChanged<String> onSearch;
  final bool loading;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Set the status bar to light content
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final appTheme = AppTheme.of(context);
    final l10n = HomeL10n.of(context);
    return Material(
      color: appTheme.colorScheme.neutral,
      child: Column(
        children: [
          _Header(onSearch: widget.onSearch),
          if (widget.loading)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: x4),
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  color: appTheme.colorScheme.tertiary[600],
                ),
              ),
            )
          else
            Expanded(
              child: RefreshIndicator(
                onRefresh: widget.onRefresh,
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: x4),
                  children: [
                    MovieTopic(
                      title: l10n.trending,
                      labels: [l10n.trendingDayLabel, l10n.trendingWeekLabel],
                      onIndexChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      carousel: Builder(
                        builder: (context) {
                          if (_currentIndex == 0) {
                            return MovieCarouselContainer<
                                MoviesTrendingDayCubit>();
                          } else {
                            return MovieCarouselContainer<
                                MoviesTrendingWeekCubit>();
                          }
                        },
                      ),
                    ),
                    MovieTopic(
                      title: l10n.popular,
                      carousel:
                          MovieCarouselContainer<MoviesPopularStreamingCubit>(),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.onSearch,
  });

  final ValueChanged<String> onSearch;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final l10n = HomeL10n.of(context);
    return Material(
      color: appTheme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: x2),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: x4),
              Text(
                l10n.welcomeTitle,
                style: appTheme.theme.textTheme.titleMedium?.copyWith(
                  color: appTheme.colorScheme.backgroundContainer,
                ),
              ),
              const SizedBox(height: x2),
              Text(
                l10n.welcomeDescription,
                style: appTheme.theme.textTheme.bodyLarge?.copyWith(
                  color: appTheme.colorScheme.backgroundContainer,
                ),
              ),
              const SizedBox(height: x4),
              SearchBar(
                onButtonPressed: onSearch,
              ),
              const SizedBox(height: x4),
            ],
          ),
        ),
      ),
    );
  }
}
