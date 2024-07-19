import 'package:{{project_name.snakeCase()}}/src/app/app.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/mocks.dart';

Future<SharedPreferences> getSharedPreferences() async {
  return MockSharedPreferences();
}

void main() {
  setUpAll(() {
    registerFallbackValue(Container());
  });

  test('main does not throw', () async {
    const app = MyApp();

    await expectLater(
      app.bootstrap(
        (_) {},
        getSharedPreferences,
      ),
      completes,
    );
  });
}
