part of 'navigation.dart';

class NavigationHelper {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  static final GlobalKey<ScaffoldMessengerState> scaffoldState =
      GlobalKey<ScaffoldMessengerState>();

  static Future<dynamic> navigateTo(String routeName,
      {Map<String, dynamic>? arguments,
      bool clean = false,
      bool delete = false}) {
    if (clean) {
      return navigatorKey.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else if (delete) {
      return navigatorKey.currentState!
          .pushNamedAndRemoveUntil(routeName, (route) => false);
    } else {
      return navigatorKey.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
  }

  static void goBack() {
    return navigatorKey.currentState?.pop();
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.ONBOARDING:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      case AppRoute.SIGN_IN:
        return MaterialPageRoute(builder: (context) => const SignInView());
      case AppRoute.SIGN_UP:
        return MaterialPageRoute(builder: (context) => const SignUpView());
      case AppRoute.HOME:
        return MaterialPageRoute(builder: (_) => const HomeView());
      // Access the arguments from the map
      // final description = (settings.arguments as Map<String, dynamic>?)['description'];

      // Uncomment the following lines if you want to pass arguments to the LoginView
      // return MaterialPageRoute(
      //   builder: (_) => LoginView(
      //     description: description as String,
      //   ),
      // );
      default:
        return MaterialPageRoute(builder: (_) => const App());
    }
  }
}
