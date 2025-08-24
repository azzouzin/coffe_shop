import 'package:coffe_shop/core/assets_paths.dart';
import 'package:coffe_shop/features/home/view_model/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/categories_list.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/coffe_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      "Espresso",
      "Cappuccino",
      "Latte",
      "Mocha",
      "Americano",
    ];
    final coffees = List.generate(10, (index) => "Coffee $index");

    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit()..changeCategorie(0),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            const HomeAppBar(),

            // 🔹 Categories
            Categories(categories: categories),

            // 🔹 Grid with per-item parallax
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return CoffeeParallaxCard(
                    title: coffees[index],
                    subtitle: "Delicious coffee",
                    imageUrl: Assets.coffee2, // Replace with actual image URL
                    price: 3.99 + index,
                    rating: 4.5 + (index % 5) * 0.1,
                  );
                }, childCount: coffees.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // mainAxisSpacing: 8,
                  // crossAxisSpacing: 8,
                  childAspectRatio: 3 / 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
