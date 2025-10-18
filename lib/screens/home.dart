import 'package:flutter/material.dart';
import '../widgets/succes_message.dart';
import '../widgets/header_section.dart';
import '../widgets/navigation_bar_app.dart';
import '../widgets/recipe_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const HeaderSection(
            title: 'Mes recettes',
            showBackButton: false,
          ),
          // Bannière de succès (optionnelle)
          const SuccessMessage(
            message: 'Recette ajoutée avec succès !',
          ),
          // Liste des recettes
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              children: [
                RecipeCard(
                  title: 'Tarte aux pommes',
                  duration: 45,
                  difficulty: 'Moyen',
                  imageUrl: null,
                  onTap: () {
                    Navigator.pushNamed(context, '/detail');
                  },
                ),
                RecipeCard(
                  title: 'Salade César',
                  duration: 15,
                  difficulty: 'Facile',
                  imageUrl: null,
                  onTap: () {
                    Navigator.pushNamed(context, '/detail');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const NavigationBarApp(),
    );
  }
}
