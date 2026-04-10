import 'models/Resources.dart';
import 'views/ConsoleView.dart';
import 'controllers/MachineController.dart';

void main() {
  const int INITIAL_BEANS = 1000;
  const int INITIAL_MILK = 1000;
  const int INITIAL_WATER = 2000;
  const int INITIAL_CASH = 0;

  Resources resources = Resources(INITIAL_BEANS, INITIAL_MILK, INITIAL_WATER, INITIAL_CASH);
  ConsoleView view = ConsoleView();

  MachineController controller = MachineController(resources, view);
  controller.run();
}