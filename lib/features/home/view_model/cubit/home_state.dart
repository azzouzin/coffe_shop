part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<CoffeeModel> coffees;
  final List<String> categories;
  final String selectedCategory;
  final List<CoffeeModel> filteredCoffees;

  HomeLoaded({
    required this.coffees,
    required this.categories,
    required this.selectedCategory,
    required this.filteredCoffees,
  });

  HomeLoaded copyWith({
    List<CoffeeModel>? coffees,
    List<String>? categories,
    String? selectedCategory,
    List<CoffeeModel>? filteredCoffees,
  }) {
    return HomeLoaded(
      coffees: coffees ?? this.coffees,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      filteredCoffees: filteredCoffees ?? this.filteredCoffees,
    );
  }
}

final class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
