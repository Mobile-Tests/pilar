import 'package:core/flutter_bloc.dart';

import 'search_events.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState(status: SearchStatus.idle)) {
    on<SearchEvent>((event, emit) => event.execute(this, emit));
  }
}

class SearchBlocProvider extends BlocProvider<SearchBloc> {
  SearchBlocProvider({
    super.key,
    super.child,
  }) : super(create: (context) => SearchBloc());
}
