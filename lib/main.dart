import 'dart:core';
import 'package:rpi_gpio/rpi_gpio.dart';

import 'functions/output_app.dart';

void main() async {
  //final scheduledTimeInt = 7;
  //final scheduledWeekdaysIntList = [1, 2, 3, 4, 5];
  // Timer.periodic(Duration(minutes: 1), (Timer t) async {
  // if (open(scheduledTimeInt, scheduledWeekdaysIntList)) {
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
