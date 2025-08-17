import 'package:flutter/material.dart';

import '../../../core/theme/light_theme.dart';
import 'widgets/app_bar_contenent.dart';
import 'widgets/banner.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.42,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: LightThemeConstants.appBarGredients,
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [0.0, 0.99],
                      ),
                    ),
                  ),
                  AppBarContenet(),
                  MyBanner(),
                ],
              ),
            ),
          ),

          // Example body list
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                leading: const Icon(Icons.coffee),
                title: Text("Coffee item $index"),
              ),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
