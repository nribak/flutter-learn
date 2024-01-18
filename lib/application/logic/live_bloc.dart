import 'package:bloc/bloc.dart';

import '../../domain/currency.dart';

class LiveBlocState {
  final List<Currency> currencies;
  final bool isLoading;

  LiveBlocState({required this.currencies, required this.isLoading});
}

class LiveBlocEvent {}

class LiveBloc extends Bloc<LiveBlocEvent, LiveBlocState> {
  LiveBloc(): super(LiveBlocState(currencies: [], isLoading: false));

  void _init() {
    on<LiveBlocEvent>((event, emit) {
      // get the data from api/storage/static
      final list = Currency.dummyCurrencies;
      emit(LiveBlocState(currencies: list, isLoading: false));
    });
  }

  factory LiveBloc.newInstance() {
    return LiveBloc().._init();
    // final bloc = LiveBloc();
    // bloc._init();
    // return bloc;
  }
}