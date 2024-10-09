import 'package:flutter/material.dart';

// updated widget from stateful to stateless
class Counter extends StatelessWidget {
//adding this final variable so that it is easier to call 
  final int counter;
  final VoidCallback onIncrement;
  const Counter({
    super.key,
    required this.counter,
    required this.onIncrement,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: onIncrement, //here we call the onIncrement call back
          child: const Text('Dumagdag'),
        ),
        const SizedBox(width: 16),
        Text('Count: $counter'), 
      ],
    );
  }
}

//creating the parent widget
class CounterState extends StatefulWidget {
  const CounterState({super.key});

  @override
  _CounterParentState createState() => _CounterParentState();
}

class _CounterParentState extends State<CounterState> {
  int _counter = 0;

  //implementing a inrementcounter to add the increment condition
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(
        counter: _counter, 
        onIncrement: _incrementCounter, // Pass the increment function
      ),
    );
  }
}
//calling the class _CounterState in the void main() to display the widgets
void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: CounterState(), 
      ),
    ),
  );
}
