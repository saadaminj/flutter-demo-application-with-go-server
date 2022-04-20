import 'package:bloc/bloc.dart';
import 'package:test/blocs/title/title_event.dart';
import 'package:test/blocs/title/title_state.dart';
import 'package:test/services/title_service.dart';

class TitleBloc extends Bloc<TitleEvent, TitleState> {
  final TitleService titleService;
  TitleBloc(this.titleService) : super(const TitleInitial());

  @override
  Stream<TitleState> mapEventToState(TitleEvent event) async* {
    if (event is LoadTitle) {
      yield* _mapAppLoadedToState(event);
    }
  }

  Stream<TitleState> _mapAppLoadedToState(LoadTitle event) async* {
    yield const TitleLoading();
    var resp = await titleService.getTitle();
    yield TitleLoaded(resp);
  }
}
