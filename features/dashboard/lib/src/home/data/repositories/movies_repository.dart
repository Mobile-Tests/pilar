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

  @override
  Future<PaginatedResponse<Movie>> getTrendingDay({int page = 1}) async {
    final request = HttpRequest(
      path: 'https://api.themoviedb.org/3/trending/movie/day',
      queryParameters: {'page': page},
    );
    final response = await httpClient.get(request);
    return PaginatedResponse<Movie>.fromJson(response.dataJson, Movie.fromMap);
  }

  @override
  Future<PaginatedResponse<Movie>> getTrendingWeek({int page = 1}) async {
    final request = HttpRequest(
      path: 'https://api.themoviedb.org/3/trending/movie/week',
      queryParameters: {'page': page},
    );
    final response = await httpClient.get(request);
    return PaginatedResponse<Movie>.fromJson(response.dataJson, Movie.fromMap);
  }

  @override
  Future<PaginatedResponse<Movie>> getPopularStreaming({int page = 1}) async {
    final request = HttpRequest(
      path: 'https://api.themoviedb.org/3/movie/popular',
      queryParameters: {'page': page},
    );
    final response = await httpClient.get(request);
    return PaginatedResponse<Movie>.fromJson(response.dataJson, Movie.fromMap);
  }
}
