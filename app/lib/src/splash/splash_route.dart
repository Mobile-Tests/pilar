import 'dart:developer';

import 'package:core/core.dart';
import 'package:core/go_router.dart';

import 'widgets/splash_screen.dart';

class SplashRoute extends GoRoute {
  SplashRoute()
      : super(
          name: RouteNames.splash,
          path: '/',
          builder: (context, state) {
            return SplashScreen(
              onAnimationDone: () {
                log('Animation done :)');
              },
            );
          },
        );
}
