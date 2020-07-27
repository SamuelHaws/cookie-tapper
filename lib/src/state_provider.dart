import 'dart:async';
import 'package:flutter/material.dart';
import 'models/export_models.dart';

class StateProvider with ChangeNotifier {
  Timer timer;

  int cookieCount = 0;
  List<AutoClicker> autoClickers;

  StateProvider() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => increment());
    autoClickers = [];
  }

  void increment() {
    cookieCount++;
    notifyListeners();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
