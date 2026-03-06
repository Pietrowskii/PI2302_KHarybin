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

  static const int CoffeeBeansForEspresso = 50;
  static const int WaterForEspresso = 100;

  bool isAvailableResources(){
    return _coffeeBeans >= CoffeeBeansForEspresso && _water >= WaterForEspresso;
  }
}