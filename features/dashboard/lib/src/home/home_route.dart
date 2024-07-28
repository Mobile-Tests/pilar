import 'package:core/core.dart';
import 'package:core/go_router.dart';

import 'widgets/home_screen.dart';

class HomeRoute extends GoRoute {
  HomeRoute()
      : super(
          path: '/home',
          name: RouteNames.home,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              name: RouteNames.home,
              child: HomeScreen(),
            );
          },
        );
}
