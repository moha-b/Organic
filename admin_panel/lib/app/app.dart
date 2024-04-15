import 'package:admin_panel/core/managers/managers.dart';
import 'package:admin_panel/core/navigation/navigation.dart';
import 'package:admin_panel/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:admin_panel/features/dashboard/data/repo/dashboard_repo.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DashboardBloc(DependencyManager.get<DashboardRepository>())
            ..add(ViewAllProducts()),
      child: MaterialApp(
        onGenerateRoute: NavigationHelper.generateRoute,
        initialRoute: AppRoute.DASHBOARD,
        scrollBehavior: ScrollBehaviorManager(),
        navigatorKey: NavigationHelper.navigatorKey,
        navigatorObservers: [NavigationHelper.routeObserver],
        theme: FlexThemeData.dark(scheme: FlexScheme.greenM3),
      ),
    );
  }
}
