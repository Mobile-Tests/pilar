import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'movie_card.dart';

class MovieCarousel extends StatelessWidget {
  const MovieCarousel({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: x4),
          child: Text(
            title,
            style: appTheme.theme.textTheme.titleMedium?.copyWith(
              color: appTheme.colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(height: x2),
        const _ToggleSwitch(
          labels: ['Hoje', 'Nesta Semana'],
          initialLabelIndex: 0,
        ),
        const SizedBox(height: x4),
        SizedBox(
          height: 350,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: x4),
              SizedBox(
                width: 150,
                child: MovieCard(
                  title: 'Deadpool & Wolverine',
                  imageUrl:
                      'https://image.tmdb.org/t/p/w200/qkhZRqCWqJ376sBzD4MeAO2w4wv.jpg',
                  percentage: 81,
                  releaseDate: DateTime.parse('2024-07-24'),
                ),
              ),
              const SizedBox(width: x4),
              SizedBox(
                width: 150,
                child: MovieCard(
                  title: 'Deadpool & Wolverine',
                  imageUrl:
                      'https://image.tmdb.org/t/p/w200/qkhZRqCWqJ376sBzD4MeAO2w4wv.jpg',
                  percentage: 81,
                  releaseDate: DateTime.parse('2024-07-24'),
                ),
              ),
              const SizedBox(width: x4),
              SizedBox(
                width: 150,
                child: MovieCard(
                  title: 'Deadpool & Wolverine',
                  imageUrl:
                      'https://image.tmdb.org/t/p/w200/qkhZRqCWqJ376sBzD4MeAO2w4wv.jpg',
                  percentage: 81,
                  releaseDate: DateTime.parse('2024-07-24'),
                ),
              ),
              const SizedBox(width: x4),
              SizedBox(
                width: 150,
                child: MovieCard(
                  title: 'Deadpool & Wolverine',
                  imageUrl:
                      'https://image.tmdb.org/t/p/w200/qkhZRqCWqJ376sBzD4MeAO2w4wv.jpg',
                  percentage: 81,
                  releaseDate: DateTime.parse('2024-07-24'),
                ),
              ),
              const SizedBox(width: x4),
            ],
          ),
        ),
      ],
    );
  }
}

class _ToggleSwitch extends StatefulWidget {
  const _ToggleSwitch({
    required this.labels,
    required this.initialLabelIndex,
  });

  final List<String> labels;
  final int initialLabelIndex;

  @override
  State<_ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<_ToggleSwitch> {
  late int _selectedIndex = widget.initialLabelIndex;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return Row(
      children: [
        const Spacer(),
        Flexible(
          child: SizedBox(
            height: x10,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: widget.labels.length,
              separatorBuilder: (context, index) => const SizedBox(width: x2),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: x2),
                    decoration: BoxDecoration(
                      color: index == _selectedIndex
                          ? appTheme.colorScheme.primary
                          : appTheme.colorScheme.backgroundContainer,
                      borderRadius: BorderRadius.circular(x6),
                      border: Border.all(
                        color: appTheme.colorScheme.primary,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        widget.labels[index],
                        style: appTheme.theme.textTheme.labelMedium?.copyWith(
                          color: index == _selectedIndex
                              ? appTheme.colorScheme.backgroundContainer
                              : appTheme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(width: x2),
      ],
    );
  }
}
