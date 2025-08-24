import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/coffee_model.dart';

class CoffeeService {
  static const String _databasePath = 'assets/database/coffee_database.json';

  Future<List<CoffeeModel>> loadCoffees() async {
    try {
      // Load the JSON file from assets
      final String jsonString = await rootBundle.loadString(_databasePath);

      // Parse the JSON string to a List
      final List<dynamic> jsonList = json.decode(jsonString);

      // Convert each JSON object to a CoffeeModel
      final List<CoffeeModel> coffees = jsonList
          .map((json) => CoffeeModel.fromJson(json))
          .toList();

      return coffees;
    } catch (e) {
      throw Exception('Failed to load coffee data: $e');
    }
  }

  Future<List<CoffeeModel>> getCoffeesByCategory(String category) async {
    final List<CoffeeModel> allCoffees = await loadCoffees();
    return allCoffees.where((coffee) => coffee.category == category).toList();
  }

  Future<List<String>> getCategories() async {
    final List<CoffeeModel> allCoffees = await loadCoffees();
    return allCoffees.map((coffee) => coffee.category).toSet().toList();
  }
}
