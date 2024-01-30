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
    on<LiveBlocEvent>((event, emit) async {
      // get the data from api/storage/static
      emit(LiveBlocState(currencies: state.currencies, isLoading: true));

      await Future.delayed(Duration(seconds: 1));
      // Future.delayed(Duration(seconds: 2)).then((res) {
      //
      // });
      final list = Currency.dummyCurrencies;
      emit(LiveBlocState(currencies: list, isLoading: false));
    });
  }

  factory LiveBloc.newInstance() => LiveBloc().._init();
}