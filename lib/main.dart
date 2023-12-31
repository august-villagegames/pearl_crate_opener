import 'dart:async';
import 'dart:core';
import 'package:rpi_gpio/gpio.dart';
import 'package:rpi_gpio/rpi_gpio.dart';
import 'functions/get_date_time.dart';
import 'functions/output_app.dart';

final scheduledTimeInt = 7;
final scheduledWeekdaysIntList = [1, 2, 3, 4, 5];

void main() async {
  try {
    final gpio = await initialize_RpiGpio();
    Timer.periodic(Duration(minutes: 1), (Timer t) async {
      if (checkDayAndTimeMatch(
          scheduledTimeInt: scheduledTimeInt,
          scheduledWeekdaysIntList: scheduledWeekdaysIntList)) {
        await unlockLock(gpio);
        print('It is time to open the door!');
      } else {
        print('It is not time to open the door yet.');
      }
    });
  } on GpioException catch (e) {
    print(e);
    print(DateTime.now().weekday);
    print(DateTime.now().hour);
    print(
        "time check: ${checkDayAndTimeMatch(scheduledTimeInt: scheduledTimeInt, scheduledWeekdaysIntList: scheduledWeekdaysIntList)}");
    print('It is time to open the door!');
  } catch (e) {
    print('Unexpected error: $e');
  }
}
