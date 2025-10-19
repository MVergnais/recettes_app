class Recipe {
  final String id;
  final String title;
  final int duration;
  final String difficulty;
  final List<String> ingredients;
  final List<String> steps;
  final String? imageUrl;

  Recipe({
    required this.id,
    required this.title,
    required this.duration,
    required this.difficulty,
    required this.ingredients,
    required this.steps,
    this.imageUrl,
  });
}
