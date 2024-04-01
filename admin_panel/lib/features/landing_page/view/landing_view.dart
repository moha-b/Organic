import 'package:admin_panel/core/navigation/navigation.dart';
import 'package:admin_panel/core/resources/resources.dart';
import 'package:admin_panel/features/landing_page/bloc/bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => NavigationHelper.navigateTo(AppRoute.ADD_PRODUCT),
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<LandingBloc, LandingState>(
        builder: (context, state) {
          if (state is LandingInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LandingLoaded) {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Products',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Expanded(
                    child: state.products.isNotEmpty
                        ? ListView.separated(
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 16.w),
                            itemCount: state.products.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final product = state.products[index];
                              return Card(
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(product.name),
                                      Text('\$${product.price.toString()}'),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : const Center(child: Text("No data yet")),
                  ),
                ],
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
