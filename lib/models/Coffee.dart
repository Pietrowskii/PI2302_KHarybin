import 'ICoffee.dart';

class Espresso implements ICoffee {
  static const int BEANS = 50;
  static const int MILK = 0;
  static const int WATER = 100;
  static const int PRICE = 150;

  @override int coffeeBeans() => BEANS;
  @override int milk() => MILK;
  @override int water() => WATER;
  @override int cash() => PRICE;
}

class Americano implements ICoffee {
  static const int BEANS = 50;
  static const int MILK = 0;
  static const int WATER = 200;
  static const int PRICE = 180;

  @override int coffeeBeans() => BEANS;
  @override int milk() => MILK;
  @override int water() => WATER;
  @override int cash() => PRICE;
}

class Cappuccino implements ICoffee {
  static const int BEANS = 50;
  static const int MILK = 100;
  static const int WATER = 100;
  static const int PRICE = 200;

  @override int coffeeBeans() => BEANS;
  @override int milk() => MILK;
  @override int water() => WATER;
  @override int cash() => PRICE;
}

class Latte implements ICoffee {
  static const int BEANS = 50;
  static const int MILK = 150;
  static const int WATER = 100;
  static const int PRICE = 220;

  @override int coffeeBeans() => BEANS;
  @override int milk() => MILK;
  @override int water() => WATER;
  @override int cash() => PRICE;
}