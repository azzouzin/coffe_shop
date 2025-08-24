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
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            if (state is HomeError) {
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Error: ${state.message}',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<HomeCubit>().loadCoffees();
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state is HomeLoaded) {
              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  const HomeAppBar(),

                  // 🔹 Categories
                  Categories(
                    categories: state.categories,
                    selectedCategory: state.selectedCategory,
                    onCategoryChanged: (category) {
                      context.read<HomeCubit>().changeCategory(category);
                    },
                  ),

                  // 🔹 Grid with coffee cards
                  SliverPadding(
                    padding: const EdgeInsets.all(12),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final coffee = state.filteredCoffees[index];
                        return CoffeeParallaxCard(
                          title: coffee.name,
                          subtitle: coffee.description,
                          imageUrl: coffee.image,
                          price: coffee.price,
                          rating: coffee.stars,
                        );
                      }, childCount: state.filteredCoffees.length),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3 / 4,
                          ),
                    ),
                  ),
                ],
              );
            }

            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
