import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../models/data/initial_recipes.dart';
import '../widgets/header_section.dart';
import '../widgets/navigation_bar_app.dart';
import '../widgets/succes_message.dart';
import '../widgets/recipe_card.dart';
import 'detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Liste des initial_recipes
  List<Recipe> recipes = recipesData;

  // Afficher/masquer le succes_message
  bool showSuccessMessage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const HeaderSection(title: 'Mes Recettes', showBackButton: false),

          // succes_message (si visible)
          if (showSuccessMessage)
            const SuccessMessage(message: 'Recette ajoutée avec succès !'),

          // Liste des recettes
          Expanded(
            child: recipes.isEmpty ? _buildEmptyState() : _buildRecipeList(),
          ),
        ],
      ),
      bottomNavigationBar: const NavigationBarApp(),
    );
  }

  // Affiche la liste des recettes
  Widget _buildRecipeList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];

        return RecipeCard(
          title: recipe.title,
          duration: recipe.duration,
          difficulty: recipe.difficulty,
          imageUrl: recipe.imageUrl,
          onTap: () {
            // Navigation vers la page détail
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(recipe: recipe),
              ),
            );
          },
        );
      },
    );
  }

  // Widget état vide
  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu, size: 80, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              'Aucune recette disponible',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Commencez par ajouter votre première recette !',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
