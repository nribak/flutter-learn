import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:currencies/data/ticker.dart';

import '../../domain/currencies_repository.dart';
import '../../domain/currency.dart';
import 'live_bloc_event.dart';

class LiveBlocState {
  final List<Currency> currencies;
  final bool isLoading;

  LiveBlocState({required this.currencies, required this.isLoading});
}

class LiveBloc extends Bloc<LiveBlocEvent, LiveBlocState> {
  static const _interval = 5;
  final CurrenciesRepository currenciesRepository;
  final ticker = Ticker();
  StreamSubscription? subscription;

  LiveBloc({required this.currenciesRepository}): super(LiveBlocState(currencies: [], isLoading: false));

  void _init() {
    on<StartFetchingEvent>((event, emit) {
      final stream = ticker.tick(_interval);
      subscription = stream.listen((_) {
        runPeriodic();
      });
      emit(LiveBlocState(currencies: state.currencies, isLoading: true));
    });

    on<StopFetchingEvent>((event, emit) {
      subscription?.cancel();
      emit(LiveBlocState(currencies: state.currencies, isLoading: false));
    });

    on<OnDataChangedEvent>((event, emit) {
      emit(LiveBlocState(currencies: event.currencies, isLoading: state.isLoading));
    });
  }

  Future<void> runPeriodic() async {
    final list = await currenciesRepository.getLatestCurrencies();
    currenciesRepository.cache(list);

  }

  factory LiveBloc.newInstance({required CurrenciesRepository repository}) =>
      LiveBloc(currenciesRepository: repository).._init();
}