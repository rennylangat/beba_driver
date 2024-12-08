import 'package:flutter_test/flutter_test.dart';
import 'package:beba_driver/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('IntroViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
