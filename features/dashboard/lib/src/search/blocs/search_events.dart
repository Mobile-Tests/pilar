import 'package:core/equatable.dart';
import 'package:core/flutter_bloc.dart';

import 'search_bloc.dart';
import 'search_state.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent() : super();

  Future<void> execute(
    SearchBloc bloc,
    Emitter<SearchState> emit,
  );

  @override
  List get props => [];
}

class SearchContentEvent extends SearchEvent {
  const SearchContentEvent({
    required this.content,
  });

  final String content;

  @override
  Future<void> execute(SearchBloc bloc, Emitter<SearchState> emit) async {
    // TODO: implement SearchContentEvent
    emit(bloc.state.copyWith(status: SearchStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    emit(bloc.state.copyWith(
      status: SearchStatus.success,
      content: content,
    ));
  }
}

class SearchClearEvent extends SearchEvent {
  const SearchClearEvent();

  @override
  Future<void> execute(SearchBloc bloc, Emitter<SearchState> emit) async {
    emit(bloc.state.copyWith(status: SearchStatus.idle));
  }
}
