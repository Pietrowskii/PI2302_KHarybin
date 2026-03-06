import 'dart:io';
import '../classes/Machine.dart';

void main(){
  var CoffeeMachine = Machine(200, 500, 500, 0);
  print("Кофемашина");
  while (true) {
    print("\nКоманды: [приготовить кофе], [добавить ресурс], [выход]");
    stdout.write("Введите команду: ");
    String? input = stdin.readLineSync()?.toLowerCase();

    if (input == "выход") break;

    if (input == "приготовить кофе") {
      CoffeeMachine.makingCoffee();
    } else if (input == "добавить ресурс") {
      CoffeeMachine.coffeeBeans += 100;
      CoffeeMachine.water += 200;
      print("Ресурсы пополнены.");
    } else {
      print("Неизвестная команда.");
    }
  }
}
