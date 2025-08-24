import 'package:bloc/bloc.dart';
import '../../../../core/models/coffee_model.dart';
import '../../../../core/services/coffee_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CoffeeService _coffeeService = CoffeeService();

  HomeCubit() : super(HomeInitial()) {
    loadCoffees();
  }

  Future<void> loadCoffees() async {
    try {
      emit(HomeLoading());

      final List<CoffeeModel> coffees = await _coffeeService.loadCoffees();
      final List<String> categories = await _coffeeService.getCategories();

      // Set the first category as default selected
      final String selectedCategory = categories.isNotEmpty
          ? categories.first
          : '';
      final List<CoffeeModel> filteredCoffees = coffees
          .where((coffee) => coffee.category == selectedCategory)
          .toList();

      emit(
        HomeLoaded(
          coffees: coffees,
          categories: categories,
          selectedCategory: selectedCategory,
          filteredCoffees: filteredCoffees,
        ),
      );
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void changeCategory(String category) {
    final currentState = state;
    if (currentState is HomeLoaded) {
      final List<CoffeeModel> filteredCoffees = currentState.coffees
          .where((coffee) => coffee.category == category)
          .toList();

      emit(
        currentState.copyWith(
          selectedCategory: category,
          filteredCoffees: filteredCoffees,
        ),
      );
    }
  }
}
