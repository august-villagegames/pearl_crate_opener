import 'package:rpi_gpio/gpio.dart';

final int lockPinInt = 12;

DateTime? lastUnlock;

Future unlockLock(Gpio gpio) async {
  final now = DateTime.now();
  // if (lastUnlock != null &&
  //     now.difference(lastUnlock!) < Duration(minutes: 2)) {
  //   print('unlocked less than 2 minutes ago');
  // }
  final lockPin = gpio.output(lockPinInt);
  lockPin.value = false;
  await Future.delayed(Duration(seconds: 1));
  lockPin.value = true;
  await gpio.dispose();
  print('Unlock Complete');
  if (lockPin.value = true) {
    print('pin is off');
  }

  lastUnlock = now;
}
