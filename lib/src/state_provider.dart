import 'dart:async';
import 'package:flutter/material.dart';
import 'models/export_models.dart';

class StateProvider with ChangeNotifier {
  Timer timer;

  int cookieCount = 0;
  int autoClicksPerSec = 1;
  int cookiesPerManualClick = 1;
  List<AutoClicker> autoClickers;
  List<AutoClicker> availableAutoClickers = [];
  final Map<String, int> clickersOwned = {
    'Grandma': 0,
    'Farm': 0,
  };
  final Map<String, int> clickerCosts = {
    'Grandma': 20,
    'Farm': 50,
  };

  StateProvider() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => autoClick());
    autoClickers = [];
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
    clickersOwned[autoClickerType] += 1;
    notifyListeners();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
