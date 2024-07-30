import 'package:core/flutter_bloc.dart';
import 'package:design_system/design_system.dart';

import '../../connectivity/blocs/connectivity_cubit.dart';
import '../blocs/movies_cubits.dart';
import '../l10n/home_l10n.dart';
import 'home_screen.dart';

class HomeContainer extends BlocBuilder<ConnectivityCubit, bool> {
  HomeContainer({super.key})
      : super(
          builder: (context, connectivity) {
            if (connectivity) {
              return HomeScreen(
                onRefresh: () async {
                  context.read<MoviesTrendingDayCubit>().onRefresh();
                  context.read<MoviesTrendingWeekCubit>().onRefresh();
                  context.read<MoviesPopularStreamingCubit>().onRefresh();
                },
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
