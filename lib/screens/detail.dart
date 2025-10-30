// ============================================================================
// FICHIER MODIFIÉ : lib/screens/detail.dart
// Espace de 8px entre l'image et le titre
// ============================================================================

import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../widgets/navigation_bar_app.dart';

class DetailPage extends StatelessWidget {
  final Recipe recipe;

  const DetailPage({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Image avec le bouton retour
          _buildHeader(context),

          const SizedBox(height: 8),

          // Contenu de la page
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Titre, durée et difficulté
                  _buildTitleSection(),
                  const SizedBox(height: 16),
                  const Divider(height: 1),
                  const SizedBox(height: 16),
                  // Ingrédients
                  _buildIngredientsSection(),
                  const SizedBox(height: 16),
                  const Divider(height: 1),
                  const SizedBox(height: 16),
                  // étapes de préparation
                  _buildStepsSection(),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const NavigationBarApp(),
    );
  }

  // En tête de page et bouton retour
  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        // Image de fond degrade si pas d'image
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: _getGradientForDifficulty(recipe.difficulty),
          ),
          child: recipe.imageUrl != null
              ? Image.network(
                  recipe.imageUrl!,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Icon(
                        Icons.restaurant,
                        size: 80,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    );
                  },
                )
              : Center(
                  child: Icon(
                    Icons.restaurant,
                    size: 80,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
        ),

        // Bouton retour
        Positioned(
          top: 40,
          left: 16,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black87),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }

  // Informations
  Widget _buildTitleSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre
          Text(
            recipe.title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),

          // Durée et difficulté
          Row(
            children: [
              // Durée
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 20,
                      color: Colors.grey.shade700,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${recipe.duration} min',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),

              // Difficulté
              _buildDifficultyBadge(recipe.difficulty),
            ],
          ),
        ],
      ),
    );
  }

  // Section ingrédients
  Widget _buildIngredientsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre de la section
          Row(
            children: [
              Icon(Icons.shopping_basket, size: 24, color: Colors.orange),
              const SizedBox(width: 8),
              const Text(
                'Ingrédients',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Liste des ingrédients
          ...recipe.ingredients.map((ingredient) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Puce orange
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Texte de l'ingrédient
                  Expanded(
                    child: Text(
                      ingredient,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  // Section étapes de préparation
  Widget _buildStepsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre de la section
          Row(
            children: [
              Icon(Icons.list_alt, size: 24, color: Colors.orange),
              const SizedBox(width: 8),
              const Text(
                'Préparation',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Liste des étapes
          ...List.generate(recipe.steps.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Numéro de l'étape
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Texte de l'étape
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        recipe.steps[index],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  // Badge de difficulté
  Widget _buildDifficultyBadge(String difficulty) {
    Color color;
    switch (difficulty) {
      case 'Facile':
        color = Colors.green;
        break;
      case 'Moyen':
        color = Colors.orange;
        break;
      case 'Difficile':
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        difficulty,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  // Dégradé selon la difficulté
  LinearGradient _getGradientForDifficulty(String difficulty) {
    switch (difficulty) {
      case 'Facile':
        return const LinearGradient(
          colors: [Color(0xFF56CCF2), Color(0xFF2F80ED)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'Moyen':
        return const LinearGradient(
          colors: [Color(0xFFFF6B9D), Color(0xFFC06C84)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'Difficile':
        return const LinearGradient(
          colors: [Color(0xFFFF6B6B), Color(0xFFEE5A6F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      default:
        return const LinearGradient(
          colors: [Color(0xFF9E9E9E), Color(0xFF757575)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
    }
  }
}
