import '../models/Resources.dart';
import '../models/ICoffee.dart';
import '../models/Coffee.dart';
import '../models/Enums.dart';
import '../views/ConsoleView.dart';

class MachineController {
  final Resources _resources;
  final ConsoleView _view;

  MachineController(this._resources, this._view);

  void run() {
    bool isWorking = true;

    while (isWorking) {
      _view.showMenu();
      String? input = _view.getUserInput();

      switch (input) {
        case '1':
          _makeCoffee(CoffeeType.espresso);
          break;
        case '2':
          _makeCoffee(CoffeeType.americano);
          break;
        case '3':
          _makeCoffee(CoffeeType.cappuccino);
          break;
        case '4':
          _makeCoffee(CoffeeType.latte);
          break;
        case '5':
          _addResources();
          break;
        case '6':
          _view.showResources(_resources);
          break;
        case '7':
          isWorking = false;
          _view.showMessage('Программа завершена');
          break;
        default:
          _view.showError('Неизвестная команда');
      }
    }
  }

  void _makeCoffee(CoffeeType type) {
    ICoffee? coffee = _createCoffee(type);

    if (coffee == null) {
      _view.showError('Ошибка создания кофе');
      return;
    }

    if (_canMakeCoffee(coffee)) {
      _resources.coffeeBeans -= coffee.coffeeBeans();
      _resources.milk -= coffee.milk();
      _resources.water -= coffee.water();
      _resources.cash += coffee.cash();

      _view.showMessage('Ваш кофе готов!');
    } else {
      _view.showError('Недостаточно ресурсов');
      _view.showMessage('Требуется: Кофе: ${coffee.coffeeBeans()}г, Молоко: ${coffee.milk()}мл, Вода: ${coffee.water()}мл');
    }
  }

  bool _canMakeCoffee(ICoffee coffee) {
    return (_resources.coffeeBeans >= coffee.coffeeBeans()) &&
        (_resources.milk >= coffee.milk()) &&
        (_resources.water >= coffee.water());
  }

  ICoffee? _createCoffee(CoffeeType type) {
    switch (type) {
      case CoffeeType.espresso:
        return Espresso();
      case CoffeeType.americano:
        return Americano();
      case CoffeeType.cappuccino:
        return Cappuccino();
      case CoffeeType.latte:
        return Latte();
    }
  }

  void _addResources() {
    var data = _view.getAddResourcesInput();
    _resources.coffeeBeans += data['coffee'] ?? 0;
    _resources.milk += data['milk'] ?? 0;
    _resources.water += data['water'] ?? 0;
    _resources.cash += data['cash'] ?? 0;

    _view.showMessage('Ресурсы успешно добавлены');
  }
}