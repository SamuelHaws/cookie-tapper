import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/home.dart';
import './screens/store.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MaterialApp(initialRoute: '/', routes: {
        '/': (context) => Home(),
        '/store': (context) => Store(),
      }),
    );
  }
}

class Counter with ChangeNotifier {
  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }
}
