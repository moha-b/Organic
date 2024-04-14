import 'package:flutter/material.dart';
import 'package:organic/core/navigation/navigation.dart';
import 'package:organic/features/onboarding/view/onboarding_view.dart';

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
      home: OnboardingView(),
    );
  }
}
