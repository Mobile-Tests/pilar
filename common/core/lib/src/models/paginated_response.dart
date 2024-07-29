import 'dart:convert';

import 'package:equatable/equatable.dart';

typedef FromMapCallback<T> = T Function(Map<String, dynamic>);

class PaginatedResponse<T> extends Equatable {
  const PaginatedResponse({
    required this.page,
    required this.totalPages,
    required this.results,
  });

  factory PaginatedResponse.fromMap(
    Map<String, dynamic> map,
    FromMapCallback<T> fromMap,
  ) {
    return PaginatedResponse<T>(
      page: map['page'] as int,
      totalPages: map['total_pages'] as int,
      results: (map['results'] as List<dynamic>?)
          .fromJsonList(fromMap)
          .toList()
          .cast<T>(),
    );
  }

  factory PaginatedResponse.fromJson(
    String? source,
    FromMapCallback<T> fromMap,
  ) {
    if (source == null) {
      return const PaginatedResponse(page: 1, totalPages: 1, results: []);
    } else {
      return PaginatedResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
        fromMap,
      );
    }
  }

  final int page;
  final int totalPages;
  final List<T> results;

  @override
  List get props => [page, totalPages, results];
}

extension _FromJsonListExt<T> on List<dynamic>? {
  Iterable<T> fromJsonList(FromMapCallback<T> fromMap) sync* {
    if (this != null) {
      for (final source in this!) {
        yield fromMap(source);
      }
    }
  }
}
