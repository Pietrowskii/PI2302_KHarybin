import 'dart:async';

class CoffeeMaker {
  static final CoffeeMaker _instance = CoffeeMaker._internal();

  factory CoffeeMaker() {
    return _instance;
  }

  CoffeeMaker._internal();

  Future<void> heatWater() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> brewCoffee() async {
    await Future.delayed(const Duration(seconds: 3));
  }

  Future<void> frothMilk() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> mixCoffeeAndMilk() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}