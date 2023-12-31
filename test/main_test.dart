import 'package:pearl_crate_opener/functions/output_app.dart';
import 'package:rpi_gpio/rpi_gpio.dart';

void main() async {
  print(DateTime.now().weekday);
  print(DateTime.now().hour);

  final gpio = await initialize_RpiGpio();

  await unlockLock(gpio);
  print('It is time to open the door!');
  // } else {
  // print('It is not time to open the door yet.');
  // }
  // });
}
