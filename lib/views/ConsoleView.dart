import 'dart:io';
import '../models/Resources.dart';

class ConsoleView {
  void showMenu() {
    print('\n--- МЕНЮ ---');
    print('1. Эспрессо');
    print('2. Американо');
    print('3. Капучино');
    print('4. Латте');
    print('5. Добавить ресурсы');
    print('6. Состояние ресурсов');
    print('7. Выход');
  }

  String? getUserInput() {
    stdout.write('Выберите пункт: ');
    return stdin.readLineSync()?.trim();
  }

  void showMessage(String message) {
    print(message);
  }

  void showError(String message) {
    print('Ошибка: $message');
  }

  void showResources(Resources res) {
    print('\n--- РЕСУРСЫ ---');
    print('Кофе: ${res.coffeeBeans} г');
    print('Молоко: ${res.milk} мл');
    print('Вода: ${res.water} мл');
    print('Деньги: ${res.cash} руб');
  }

  Map<String, int> getAddResourcesInput() {
    print('\n--- ДОБАВЛЕНИЕ РЕСУРСОВ ---');

    stdout.write('Кофе (г): ');
    int coffee = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

    stdout.write('Молоко (мл): ');
    int milk = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

    stdout.write('Вода (мл): ');
    int water = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

    stdout.write('Деньги (руб): ');
    int cash = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

    return {'coffee': coffee, 'milk': milk, 'water': water, 'cash': cash};
  }
}