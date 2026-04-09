import 'dart:async';

class CoffeeMaker {
  CoffeeMaker._internal();
  static final CoffeeMaker _instance = CoffeeMaker._internal();
  
  factory CoffeeMaker.create() {
    print('[SYSTEM]: Кофемашина создана через фабрику');
    return _instance;
  }

  Future<void> heatWater() async {
    print('>>> [TECH]: Нагрев воды (3 сек)...');
    await Future.delayed(const Duration(seconds: 3));
  }

  Future<void> brewCoffee() async {
    print('>>> [TECH]: Заваривание кофе (5 сек)...');
    await Future.delayed(const Duration(seconds: 5));
  }

  Future<void> frothMilk() async {
    print('>>> [TECH]: Взбивание молока (5 сек)...');
    await Future.delayed(const Duration(seconds: 5));
  }

  Future<void> mixCoffeeAndMilk() async {
    print('>>> [TECH]: Смешивание (3 сек)...');
    await Future.delayed(const Duration(seconds: 3));
  }
}