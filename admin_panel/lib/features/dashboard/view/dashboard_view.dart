import 'package:admin_panel/core/navigation/navigation.dart';
import 'package:admin_panel/core/resources/resources.dart';
import 'package:admin_panel/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:admin_panel/features/dashboard/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/common.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => NavigationHelper.navigateTo(AppRoute.ADD_PRODUCT),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<DashboardBloc, LandingState>(
        builder: (context, state) {
          if (state is LandingInitial) {
            return const LoadingWidget();
          } else if (state is LandingLoaded) {
            return ResponsiveView(
              webView: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Dashboard"),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          InfoCard(
                            title: "Products",
                            total: state.products.length.toString(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ResponsiveGridView(
                          products: state.products, crossAxisCount: 6),
                    ],
                  ),
                ),
              ),
              tabletView: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Dashboard"),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          InfoCard(
                            title: "Products",
                            total: state.products.length.toString(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ResponsiveGridView(
                        products: state.products,
                        crossAxisCount: 4,
                      ),
                    ],
                  ),
                ),
              ),
              mobileView: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Dashboard"),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          InfoCard(
                            title: "Products",
                            total: state.products.length.toString(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ResponsiveGridView(
                        products: state.products,
                        crossAxisCount: 2,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is LandingError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: Text('Unknown state'),
            );
          }
        },
      ),
    );
  }
}
