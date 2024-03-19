import 'package:currencies/domain/currency.dart';

sealed class LiveBlocEvent {}

final class StartFetchingEvent extends LiveBlocEvent {}

final class StopFetchingEvent extends LiveBlocEvent {}

final class OnDataChangedEvent extends LiveBlocEvent {
  final List<Currency> currencies;

  OnDataChangedEvent(this.currencies);
}
