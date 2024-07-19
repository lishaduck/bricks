import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/app/app.dart';

Future<void> main() async {
  await const MyApp().bootstrap(
    runApp,
    SharedPreferences.getInstance,
  );
}
