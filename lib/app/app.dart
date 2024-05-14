import 'package:flutter/material.dart';
import 'package:organic/core/caching/caching.dart';
import 'package:organic/core/navigation/navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationHelper.navigatorKey,
      debugShowCheckedModeBanner: false,
      navigatorObservers: [NavigationHelper.routeObserver],
      scaffoldMessengerKey: NavigationHelper.scaffoldState,
      onGenerateRoute: NavigationHelper.generateRoute,
      initialRoute: CachingHelper.instance!.readBoolean(CachingKey.ONBOARDING)
          ? AppRoute.SIGN_IN
          : AppRoute.ONBOARDING,
    );
  }
}
