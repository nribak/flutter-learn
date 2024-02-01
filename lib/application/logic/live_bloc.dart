import 'package:bloc/bloc.dart';

import '../../domain/currencies_repository.dart';
import '../../domain/currency.dart';

class LiveBlocState {
  final List<Currency> currencies;
  final bool isLoading;

  LiveBlocState({required this.currencies, required this.isLoading});
}

class LiveBlocEvent {}

class LiveBloc extends Bloc<LiveBlocEvent, LiveBlocState> {
  final CurrenciesRepository currenciesRepository;
  LiveBloc({required this.currenciesRepository}): super(LiveBlocState(currencies: [], isLoading: false));

  void _init() {
    on<LiveBlocEvent>((event, emit) async {
      emit(LiveBlocState(currencies: state.currencies, isLoading: true));
      final list = await currenciesRepository.getLatestCurrencies();
      emit(LiveBlocState(currencies: list, isLoading: false));
    });
  }

  factory LiveBloc.newInstance({required CurrenciesRepository repository}) =>
      LiveBloc(currenciesRepository: repository).._init();
}