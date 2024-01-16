import 'package:flutter/material.dart';

/*
1. pass callback from app to this widget - V
2. get the actual number from text field
 */

class FibonacciInput extends StatelessWidget {
  final void Function(int number) callback;

  final TextEditingController controller = TextEditingController();

  FibonacciInput({super.key, required this.callback});

  void _handleClick() {
    final value = controller.text;
    final number = int.tryParse(value);
    if(number != null) {
      callback(number);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
              controller: controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
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
    );
  }
}