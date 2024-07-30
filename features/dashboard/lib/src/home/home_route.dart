import 'package:core/core.dart';
import 'package:core/flutter_bloc.dart';
import 'package:core/go_router.dart';

import '../connectivity/blocs/connectivity_cubit.dart';
import 'blocs/movies_cubits.dart';
import 'widgets/home_container.dart';

class HomeRoute extends GoRoute {
  HomeRoute()
      : super(
          path: '/home',
          name: RouteNames.home,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              name: RouteNames.home,
              child: MultiBlocProvider(
                providers: [
                  ConnectivityCubitProvider(),
                  MoviesTrendingDayCubitProvider(),
                  MoviesTrendingWeekCubitProvider(),
                  MoviesPopularStreamingCubitProvider(),
                ],
                child: HomeContainer(),
              ),
            );
          },
        );
}
