import 'dart:io';
import '../classes/Machine.dart';

void main() {
  const int INITIAL_BEANS = 100;
  const int INITIAL_MILK = 200;
  const int INITIAL_WATER = 300;
  const int INITIAL_CASH = 0;
  const int ADD_BEANS_AMOUNT = 100;

  var CoffeeMachine = Machine(INITIAL_BEANS, INITIAL_MILK, INITIAL_WATER, INITIAL_CASH);

  print("--- Система управления кофемашиной ---");

  while (true) {
    print("\nДоступные действия:");
    print("1. Приготовить кофе");
    print("2. Добавить ресурс");
    print("3. Выход");
    stdout.write("Введите команду (текст или число): ");

    String input = stdin.readLineSync()?.trim().toLowerCase() ?? "";

    if (input == "3" || input == "выход") {
      print("Программа завершена.");
      break;
    }

    switch (input) {
      case "1":
      case "приготовить кофе":
        CoffeeMachine.makingCoffee();
        break;
      case "2":
      case "добавить ресурс":
        CoffeeMachine.coffeeBeans += ADD_BEANS_AMOUNT;
        print("Ресурсы пополнены. Теперь зерен: ${coffeeMachine.coffeeBeans}");
        break;
      case "":
        break;
      default:
        print("Ошибка: команда '$input' не распознана. Используйте цифры 1, 2 или 3.");
    }
  }
}