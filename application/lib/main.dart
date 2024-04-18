import 'package:flutter/material.dart';
import 'package:organic/core/caching/caching.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachingHelper.init();
  runApp(const App());
}
