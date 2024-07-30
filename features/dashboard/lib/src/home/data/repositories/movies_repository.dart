import 'package:core/core.dart';
import 'package:network/network.dart';

import '../models/movie.dart';

abstract class MoviesRepository {
  Future<PaginatedResponse<Movie>> getTrendingDay({int page = 1});
  Future<PaginatedResponse<Movie>> getTrendingWeek({int page = 1});
  Future<PaginatedResponse<Movie>> getPopularStreaming({int page = 1});
}

class MoviesRepositoryImpl extends MoviesRepository {
  MoviesRepositoryImpl({
    required this.httpClient,
  });

  final HttpClient httpClient;

  Future<PaginatedResponse<Movie>> _handleRequest(HttpRequest request) async {
    try {
      final response = await httpClient.get(request);
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return PaginatedResponse<Movie>.fromJson(
          response.dataJson,
          Movie.fromMap,
        );
      } else {
        throw HttpErrorResponse(
          request: request,
          message: 'HTTP error with status code ${response.statusCode}',
          error: response.dataJson,
          headers: response.headers,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      throw HttpErrorResponse(
        request: request,
        message: 'An error occurred: $e',
      );
    }
  }

  @override
  Future<PaginatedResponse<Movie>> getTrendingDay({int page = 1}) async {
    final request = HttpRequest(
      path: 'https://api.themoviedb.org/3/trending/movie/day',
      queryParameters: {'page': page},
    );
    return _handleRequest(request);
  }

  @override
  Future<PaginatedResponse<Movie>> getTrendingWeek({int page = 1}) async {
    final request = HttpRequest(
      path: 'https://api.themoviedb.org/3/trending/movie/week',
      queryParameters: {'page': page},
    );
    return _handleRequest(request);
  }

  @override
  Future<PaginatedResponse<Movie>> getPopularStreaming({int page = 1}) async {
    final request = HttpRequest(
      path: 'https://api.themoviedb.org/3/movie/popular',
      queryParameters: {'page': page},
    );
    return _handleRequest(request);
  }
}
