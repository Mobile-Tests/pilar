import 'package:core/core.dart';
import 'package:network/network.dart';

import 'src/home/data/repositories/movies_repository.dart';

Future<void> initServiceLocator() async {
  di.registerFactory<MoviesRepository>(
    () => MoviesRepositoryImpl(httpClient: di<HttpClient>()),
  );
}
