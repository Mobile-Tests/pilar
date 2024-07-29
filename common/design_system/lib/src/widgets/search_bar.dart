import 'package:flutter/material.dart';

import '../l10n/design_system_l10n.dart';
import '../theme/app_theme.dart';
import '../utils/spacings.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    super.key,
    required this.onButtonPressed,
  });

  final ValueChanged<String> onButtonPressed;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final l10n = DesignSystemL10n.of(context);
    return TextField(
      controller: _controller,
      style: appTheme.theme.textTheme.bodyMedium?.copyWith(
        color: appTheme.colorScheme.neutral[500],
      ),
      decoration: InputDecoration(
        hintText: l10n.searchBarHint,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: x4),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(x8)),
              gradient: LinearGradient(
                colors: [
                  appTheme.colorScheme.secondary,
                  appTheme.colorScheme.tertiary,
                ],
              ),
            ),
            child: TextButton(
              onPressed: () => widget.onButtonPressed(_controller.text),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: x3, horizontal: x4),
                child: Text(
                  l10n.searchBarBt,
                  style: appTheme.theme.textTheme.bodyLarge?.copyWith(
                    color: appTheme.colorScheme.backgroundContainer,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
