import 'package:flutter/material.dart';

class FibonacciApp extends StatelessWidget {
  const FibonacciApp({super.key});


  void _handleClick() {
    print("CLICKED!!!");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child:  Column(
            children: [
              Row(
                children: [
                  const Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            label: Text("number"),
                            hintText: "enter number here..."
                        )
                      )
                  ),
                  ElevatedButton(
                      onPressed: _handleClick,
                      child: const Text("calculate")
                  )
                ],
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 16),
                  Text("fib(1)=1 1ms")
                ],
              )
            ]
        )
    );
  }
}