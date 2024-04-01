import 'package:admin_panel/app/widgets/widgets.dart';
import 'package:admin_panel/core/managers/managers.dart';
import 'package:admin_panel/core/navigation/navigation.dart';
import 'package:admin_panel/features/landing_page/bloc/bloc_bloc.dart';
import 'package:admin_panel/features/landing_page/data/repo/langing_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LandingBloc(DependencyManager.get<LandingRepository>())
            ..add(ViewAllProducts()),
      child: MaterialApp(
        onGenerateRoute: NavigationHelper.generateRoute,
        initialRoute: AppRoute.LANDING_PAGE,
        navigatorKey: NavigationHelper.navigatorKey,
        navigatorObservers: [NavigationHelper.routeObserver],
        home: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return WebView();
            } else if (constraints.maxWidth > 400) {
              return TabletView();
            } else {
              return MobileView();
            }
          },
        ),
      ),
    );
  }
}
