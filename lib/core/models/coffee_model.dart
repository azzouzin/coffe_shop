class CoffeeModel {
  final String name;
  final String category;
  final double price;
  final double stars;
  final int reviews;
  final String image;
  final List<String> ingredients;
  final String servingTime;
  final String description;

  CoffeeModel({
    required this.name,
    required this.category,
    required this.price,
    required this.stars,
    required this.reviews,
    required this.image,
    required this.ingredients,
    required this.servingTime,
    required this.description,
  });

  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return CoffeeModel(
      name: json['name'] ?? '',
      category: json['category'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      stars: (json['stars'] ?? 0.0).toDouble(),
      reviews: json['reviews'] ?? 0,
      image: json['image'] ?? '',
      ingredients: List<String>.from(json['ingredients'] ?? []),
      servingTime: json['serving_time'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'price': price,
      'stars': stars,
      'reviews': reviews,
      'image': image,
      'ingredients': ingredients,
      'serving_time': servingTime,
      'description': description,
    };
  }
}
