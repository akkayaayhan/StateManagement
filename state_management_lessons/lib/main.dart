import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_lessons/riverpod_basics.dart';
import 'package:state_management_lessons/state_notifier_kullanimi.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StateNotifierKullanimi(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const MyText(),
            MyCounterText(sayac: _counter),
          ],
        ),
      ),
      floatingActionButton: MyFloatingActionButton(
        onArttir: () {
          _counter++;
          setState(() {});
        },
      ),
    );
  }
}

class MyCounterText extends StatelessWidget {
  final int sayac;
  const MyCounterText({Key? key, required this.sayac}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      sayac.toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  VoidCallback onArttir;
  MyFloatingActionButton({Key? key, required this.onArttir}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onArttir();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'You have pushed the button this many times:',
    );
  }
}
