import 'package:core/core.dart';
import 'package:dio/dio.dart';

import 'src/http/http_client.dart';

Future<void> initServiceLocator() async {
  di.registerFactory<Dio>(Dio.new);

  di.registerFactory<HttpClient>(
    () => HttpClientImpl(dio: di()),
  );
}
