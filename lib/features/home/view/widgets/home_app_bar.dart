import 'package:flutter/material.dart';

import '../../../../core/theme/light_theme.dart';
import 'app_bar_contenent.dart';
import 'banner.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double expandedHeight = MediaQuery.of(context).size.height * 0.32;

    return SliverAppBar(
      pinned: true,
      floating: true,
      expandedHeight: expandedHeight,
      backgroundColor: Colors.transparent,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          var currentHeight = constraints.biggest.height;
          bool collapsed = currentHeight <= kToolbarHeight + 100;

          return FlexibleSpaceBar(
            centerTitle: true,
            title: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.5),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              ),
              child: collapsed
                  ? SizedBox.expand(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.brown.shade800, Colors.black87],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: const [0.0, 0.99],
                          ),
                        ),
                        child: Text(
                          "☕ Coffee Time",
                          key: ValueKey("collapsedTitle"),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(key: ValueKey("emptyTitle")),
            ),
            collapseMode: CollapseMode.parallax,
            background: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              child: Stack(
                children: [
                  Container(
                    height: expandedHeight,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: collapsed
                            ? [Colors.brown.shade800, Colors.black87]
                            : LightThemeConstants.appBarGredients,
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
          );
        },
      ),
    );
  }
}
