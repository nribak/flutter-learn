import 'package:fibonacci/fibonacci_helper.dart';
import 'package:fibonacci/fibonacci_state.dart';
import 'package:fibonacci/widgets/fibonacci_input.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FibonacciApp extends StatefulWidget {
  const FibonacciApp({super.key});

@override
  State<StatefulWidget> createState() => _FibonacciAppState();
}

class _FibonacciAppState extends State<FibonacciApp> {
  var state = FibonacciState(
      input: 0,
      output: 0,
      time: 0,
      inProgress: false
  );

  void _calculate(int number) {
    final now = DateTime.now().millisecondsSinceEpoch;
    setState(() {
      state = FibonacciState(
          input: number,
          output: 0,
          time: 0,
          inProgress: true
      );
    });
    final Future<int> fib = compute(calcFibonacci, number);
    fib.then((value) {
      final newState = FibonacciState(
          input: number,
          output: value,
          time: DateTime.now().millisecondsSinceEpoch - now,
          inProgress: false
      );
      setState(() {
        state = newState;
      });
    });

  }

  String get stateText => "fib(${state.input}) = ${state.output} with time of ${state.time} ms";

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child:  Column(
            children: [
              FibonacciInput(callback: _calculate),
              const SizedBox(height: 16),
              Row(
                children: [
                  Visibility(
                    visible: state.inProgress,
                      child: const CircularProgressIndicator()
                  ),
                  const SizedBox(width: 16),
                  Text(stateText)
                ],
              )
            ]
        )
    );
  }
}