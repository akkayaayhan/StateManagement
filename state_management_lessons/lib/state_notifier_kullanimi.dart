import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'all_providers.dart';

class StateNotifierKullanimi extends StatelessWidget {
  const StateNotifierKullanimi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(builder: ((context, ref, child) {
          var title = ref.watch(title2Provider);
          return Text(title);
        })),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const MyText(),
            MyCounterText(),
          ],
        ),
      ),
      floatingActionButton: MyFloatingActionButton(),
    );
  }
}

class MyCounterText extends ConsumerWidget {
  const MyCounterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sayacDegeri = ref.watch(sayacNotifierProvider);
    return Text(
      sayacDegeri.sayac.toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class MyFloatingActionButton extends ConsumerWidget {
  MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(sayacNotifierProvider.notifier).arttir();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class MyText extends ConsumerWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(ref.watch(textProvider));
  }
}
