import '../models/Resources.dart';
import '../models/ICoffee.dart';
import '../models/Coffee.dart';
import '../models/Enums.dart';
import '../views/ConsoleView.dart';
import '../services/CoffeeMaker.dart';

class MachineController {
  final Resources _resources;
  final ConsoleView _view;
  final CoffeeMaker _coffeeMaker = CoffeeMaker.create();

  MachineController(this._resources, this._view);

  final Map<CoffeeType, String> _coffeeNamesRu = {
    CoffeeType.espresso: 'Эспрессо',
    CoffeeType.americano: 'Американо',
    CoffeeType.cappuccino: 'Капучино',
    CoffeeType.latte: 'Латте',
  };

  void run() async {
    bool isWorking = true;

    while (isWorking) {
      _view.showMenu();
      String? input = _view.getUserInput();

      switch (input) {
        case '1':
          await _makeCoffee(CoffeeType.espresso);
          break;
        case '2':
          await _makeCoffee(CoffeeType.americano);
          break;
        case '3':
          await _makeCoffee(CoffeeType.cappuccino);
          break;
        case '4':
          await _makeCoffee(CoffeeType.latte);
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

  Future<void> _makeCoffee(CoffeeType type) async {
    ICoffee? coffee = _createCoffee(type);

    if (coffee == null) {
      _view.showError('Ошибка создания рецепта');
      return;
    }

    if (_canMakeCoffee(coffee)) {
      _view.showMessage('\n[ПРОЦЕСС]: Начинаем приготовление ${type.name}...');

      await _coffeeMaker.heatWater();

      if (type == CoffeeType.espresso || type == CoffeeType.americano) {
        await _coffeeMaker.brewCoffee();
      } else {
        _view.showMessage('[ПРОЦЕСС]: Параллельный запуск заваривания и взбивания...');

        await Future.wait<void>([
          _coffeeMaker.brewCoffee(),
          _coffeeMaker.frothMilk(),
        ]);

        await _coffeeMaker.mixCoffeeAndMilk();
      }

      _resources.coffeeBeans -= coffee.coffeeBeans();
      _resources.milk -= coffee.milk();
      _resources.water -= coffee.water();
      _resources.cash += coffee.cash();

      _view.showMessage('----------------------------');
      _view.showMessage('Ваш ${_coffeeNamesRu[type]} готов!');
      _view.showMessage('----------------------------');
    } else {
      _view.showError('Недостаточно ресурсов для этого напитка');
      _view.showMessage('Нужно: Кофе: ${coffee.coffeeBeans()}г, Молоко: ${coffee.milk()}мл, Вода: ${coffee.water()}мл');
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
      default:
        return null;
    }
  }

 void _addResources() {
    var data = _view.getAddResourcesInput();
    _resources.coffeeBeans += data['coffee'] ?? 0;
    _resources.milk += data['milk'] ?? 0;
    _resources.water += data['water'] ?? 0;
    _resources.cash += data['cash'] ?? 0;

    _view.showMessage('Ресурсы успешно обновлены');
  }
}