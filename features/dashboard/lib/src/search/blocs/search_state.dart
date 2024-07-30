import 'package:core/equatable.dart';

enum SearchStatus { idle, loading, success, error }

class SearchState extends Equatable {
  const SearchState({
    required this.status,
    this.content,
  });

  final SearchStatus status;
  final String? content;

  @override
  List get props => [status, content];

  SearchState copyWith({
    SearchStatus? status,
    String? content,
  }) {
    return SearchState(
      status: status ?? this.status,
      content: content ?? this.content,
    );
  }
}
