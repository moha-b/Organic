import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:organic/core/utils/utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<double> _generateRandomHeights(int count) {
    final Random random = Random();
    return List.generate(count, (_) => random.nextDouble() * 200 + 250);
  }

  late final List<double> heights;
  @override
  void initState() {
    super.initState();
    heights = _generateRandomHeights(20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.SCAFFOLD,
      body: Padding(
        padding: 8.allInsets,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.SCAFFOLD,
              flexibleSpace: Column(
                children: [
                  SizedBox(height: 40.h),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Hey! What do you want?",
                              style: AppText.h1(),
                            ),
                          ),
                          Expanded(
                            child: CircleAvatar(
                              radius: 30.r,
                              child:
                                  const Icon(IconsaxPlusBroken.profile_2user),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              expandedHeight: 100.h,
            ),
            SliverMasonryGrid(
              mainAxisSpacing: 8.w,
              crossAxisSpacing: 8.h,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return SizedBox(
                    height: heights[index],
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple[100],
                                  borderRadius: BorderRadius.circular(35.r),
                                ),
                                margin: 16.allInsets,
                              ),
                              Positioned(
                                bottom: 10.h,
                                right: 10.w,
                                child: Container(
                                  padding: 6.allInsets,
                                  decoration: BoxDecoration(
                                    color: AppColors.WHITE,
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: const Icon(IconsaxPlusLinear.add),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text("Product Name", style: AppText.productTitle()),
                        Text("Product Price", style: AppText.price()),
                      ],
                    ),
                  );
                },
                childCount: heights.length,
              ),
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
