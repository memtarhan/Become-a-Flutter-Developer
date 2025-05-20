class Recipe {
  String label;
  String imageUrl;

  // TODO: Add servings and ingredients here

  Recipe(this.label, this.imageUrl);

  static List<Recipe> samples = [
    Recipe('Spaghetti and Meatballs', 'assets/food-1.jpeg'),
    Recipe('Tomato Soup', 'assets/food-2.jpeg'),
    Recipe('Grilled Cheese', 'assets/food-3.jpeg'),
    Recipe('Chocolate Chip Cookies', 'assets/food-4.jpeg'),
    Recipe('Taco Salad', 'assets/food-5.jpeg'),
    Recipe('Hawaiian Pizza', 'assets/food-6.jpeg'),
  ];
}

// TODO: Add Ingredient class here
