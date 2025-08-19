
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/cubit/home_cubit.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.categories,
  });

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                            duration: const Duration(seconds: 2),
                            curve: Curves.easeInOut,
                            child: Chip(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              side: BorderSide(
                                color: Colors.transparent,
                              ),
                              label: Text(categories[index]),
                              backgroundColor: state.categorie == index
                                  ? Theme.of(context).primaryColor
                                  : const Color.fromARGB(
                                      255,
                                      223,
                                      223,
                                      223,
                                    ),
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.normal,
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
    );
  }
}
