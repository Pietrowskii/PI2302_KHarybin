class Machine {
  int _coffeeBeans;
  int _milk;
  int _water;
  int _cash;

  Machine(this._coffeeBeans, this._milk, this._water, this._cash);

  int get coffeeBeans => _coffeeBeans;
  int get milk => _milk;
  int get water => _water;
  int get cash => _cash;

  set coffeeBeans(int value) => _coffeeBeans = value;
  set milk(int value) => _milk = value;
  set water(int value) => _water = value;
  set cash(int value) => _cash = value;

  static const int COFFEE_BEANS_FOR_ESPRESSO = 50;
  static const int WATER_FOR_ESPRESSO = 100;
  static const int MILK_FOR_ESPRESSO = 0;

  bool isAvailableResources(){
    return _coffeeBeans >= COFFEE_BEANS_FOR_ESPRESSO && _water >= WATER_FOR_ESPRESSO;
  }
  void _subtractResources(int coffeeBeansAmount, int milkAmount, int waterAmount) {
    _coffeeBeans -= coffeeBeansAmount;
    _milk -= milkAmount;
    _water -= waterAmount;
  }
  void makingCoffee() {
    if (isAvailableResources()) {
      _subtractResources(COFFEE_BEANS_FOR_ESPRESSO, MILK_FOR_ESPRESSO, WATER_FOR_ESPRESSO);
      print("Эспрессо готов!");
    } else {
      print("Ресурсов недостаточно!");
    }
  }
}