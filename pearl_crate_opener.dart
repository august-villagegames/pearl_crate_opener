import 'package:pearl_crate_opener/main.dart';
import 'test/main_test.dart' as test;

bool testOn = true;

void runMain() {
  if (testOn == true) {
    test.main();
  } else {
    main();
  }
}
