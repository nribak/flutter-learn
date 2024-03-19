import 'dart:async';

int _fib(int n) {
  if(n <= 2) {
    return 1;
  }
  int a = 0, b = 1, c = 1;
  for (int i = 2; i <= n; i++) {
    c = a + b;
    a = b;
    b = c;
  }
  return c;
}


Stream<int> fibonacciSeries(int n) async* {
  for(var i = 1; i <= n; ++i) {
    yield _fib(i);
  }
}


void main() async {
  final list = [1,2,3];
  print(list.runtimeType);
  /// producers
  final periodicStream = Stream.periodic(Duration(milliseconds: 250), (index) => index).take(10);
  periodicStream.listen((event) {
    print("PERIODIC: $event");
  });
///
  final controller = StreamController<int>.broadcast(); // same as rxDart: PublishSubject<int>();
  controller.stream.map(_fib).listen((event) {
    print("FIB: $event");
  });
  controller.sink.add(30);
  controller.sink.add(60);
///
  final fibStream = fibonacciSeries(10);
  fibStream.listen((event) {
    print("CURRENT FIB: $event");
  });
///

  /// consumers
  final fibSeriesStream = fibonacciSeries(20).asBroadcastStream();
  fibSeriesStream.listen((event) {
    print("LISTEN: $event");
  });

  await for(var event in fibSeriesStream) {
    print("AWAIT: $event");
  }

  final Stream<int> consecutiveStream = Stream.fromIterable(Iterable.generate(100, (i) => i));
  final res = await consecutiveStream.fold(0, (previous, element) => previous + element);
  print("SUM: $res");

}