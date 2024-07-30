import 'package:flutter/material.dart';

import '../l10n/design_system_l10n.dart';
import '../theme/app_theme.dart';
import '../utils/spacings.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
    required this.message,
    this.onTryAgain,
  });

  final String message;
  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final l10n = DesignSystemL10n.of(context);
    return Material(
      color: appTheme.colorScheme.neutral,
      child: Padding(
        padding: const EdgeInsets.all(x4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning,
              color: appTheme.colorScheme.primary,
            ),
            Flexible(
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: appTheme.theme.textTheme.titleLarge?.copyWith(
                  color: appTheme.colorScheme.primary,
                ),
              ),
            ),
            if (onTryAgain != null) const SizedBox(height: x8),
            if (onTryAgain != null)
              ElevatedButton(
                onPressed: onTryAgain,
                child: Text(
                  l10n.tryAgainBt,
                  textAlign: TextAlign.center,
                  style: appTheme.theme.textTheme.titleSmall?.copyWith(
                    color: appTheme.colorScheme.neutral,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
