import 'dart:io';
import '../classes/Machine.dart';

void main() {
  const int INITIAL_BEANS = 100;
  const int INITIAL_MILK = 200;
  const int INITIAL_WATER = 300;
  const int INITIAL_CASH = 0;
  const int ADD_BEANS_AMOUNT = 100;

  var coffeeMachine = Machine(INITIAL_BEANS, INITIAL_MILK, INITIAL_WATER, INITIAL_CASH);

  print("--- Система управления кофемашиной ---");

  while (true) {
    print("\nДоступные действия:");
    print("1. Приготовить кофе");
    print("2. Добавить ресурс");
    print("3. Выход");
    stdout.write("Введите команду (текст или число): ");

    String input = stdin.readLineSync()?.trim().toLowerCase() ?? "";

    switch (input) {
      case "1":
      case "приготовить кофе":
        coffeeMachine.makingCoffee();
        break;

      case "2":
      case "добавить ресурс":
        coffeeMachine.coffeeBeans += ADD_BEANS_AMOUNT;
        print("Ресурсы пополнены. Теперь зерен: ${coffeeMachine.coffeeBeans}");
        break;

      case "3":
      case "выход":
        print("Программа завершена.");
        return;

      default:
        if (input.isNotEmpty) {
          print("Ошибка: команда '$input' не распознана. Используйте цифры 1, 2 или 3.");
        }
    }
  }
}