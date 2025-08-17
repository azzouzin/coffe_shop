import 'package:coffe_shop/features/home/view_model/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
          slivers: [
            const HomeAppBar(),

            // 🔹 قائمة الكاتيغوريات أفقية
            SliverToBoxAdapter(
              child: SizedBox(
                height: 60,
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return state is HomeLoaded
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () => BlocProvider.of<HomeCubit>(
                                  context,
                                ).changeCategorie(index),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    child: Chip(
                                      label: Text(categories[index]),
                                      backgroundColor: state.categorie == index
                                          ? Theme.of(context).primaryColor
                                          : Colors.brown.shade100,
                                      labelStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: state.categorie == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : CircularProgressIndicator();
                  },
                ),
              ),
            ),

            // 🔹 Grid للقهوة مع Gradient
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [Colors.brown.shade400, Colors.brown.shade900],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        coffees[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }, childCount: coffees.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 كولونات
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 3 / 4, // شكل الكارت
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
