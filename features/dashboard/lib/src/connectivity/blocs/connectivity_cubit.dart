import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core/flutter_bloc.dart';

class ConnectivityCubit extends Cubit<bool> {
  ConnectivityCubit() : super(true);

  Future<void> checkConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    if (result.contains(ConnectivityResult.none)) {
      emit(false);
    } else {
      emit(true);
    }
  }
}

class ConnectivityCubitProvider extends BlocProvider<ConnectivityCubit> {
  ConnectivityCubitProvider({
    super.key,
    super.child,
  }) : super(
          create: (context) {
            return ConnectivityCubit()..checkConnectivity();
          },
        );
}
