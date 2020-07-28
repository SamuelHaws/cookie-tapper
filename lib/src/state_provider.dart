import 'dart:async';
import 'package:flutter/material.dart';
import 'models/export_models.dart';

class StateProvider with ChangeNotifier {
  Timer timer;

  int cookieCount = 0;
  int autoClicksPerSec = 0;
  int cookiesPerManualClick = 1;
  final Map<String, AutoClicker> availableAutoClickers = {
    'Grandma': AutoClicker('Grandma', 5, 20),
    'Farm': AutoClicker('Farm', 8, 50),
  };
  final Map<String, int> clickersOwned = {
    'Grandma': 0,
    'Farm': 0,
  };

  StateProvider() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => autoClick());
  }

  void autoClick() {
    cookieCount += autoClicksPerSec;
    notifyListeners();
  }

  void manualClick() {
    cookieCount += cookiesPerManualClick;
    notifyListeners();
  }

  void purchaseAutoClicker(String autoClickerType) {
    if (cookieCount < availableAutoClickers[autoClickerType].cost) return;
    clickersOwned[autoClickerType] += 1;
    autoClicksPerSec += availableAutoClickers[autoClickerType].clickRate;
    cookieCount -= availableAutoClickers[autoClickerType].cost;
    notifyListeners();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
