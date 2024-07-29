import 'dart:developer';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart' hide SearchBar;

import '../l10n/home_l10n.dart';
import 'movie_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          const _Header(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: x4),
              children: const [
                MovieCarousel(title: 'Tendências'),
                MovieCarousel(title: 'Os Mais Populares'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

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
              const SearchBar(
                onButtonPressed: log,
              ),
              const SizedBox(height: x4),
            ],
          ),
        ),
      ),
    );
  }
}
