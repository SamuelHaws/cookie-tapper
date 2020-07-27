import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/counter.dart';
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
