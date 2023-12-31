import 'package:rpi_gpio/gpio.dart';

final int lockPinInt = 12;
DateTime? lastUnlock;

// Replace this with the actual condition
final bool isServerEnvironment = false;

Future unlockLock(Gpio gpio) async {
  final now = DateTime.now();

  if (isServerEnvironment) {
    final lockPin = gpio.output(lockPinInt);
    lockPin.value = false;
    await Future.delayed(Duration(seconds: 1));
    lockPin.value = true;
    await gpio.dispose();
  }

  lastUnlock = now;
}
