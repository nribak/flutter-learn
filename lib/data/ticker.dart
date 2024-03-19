class Ticker {

  Stream<int> tick(int seconds) {
    return Stream.periodic(
        Duration(seconds: seconds),
            (computationCount) => DateTime.now().millisecondsSinceEpoch
    );
  }
}