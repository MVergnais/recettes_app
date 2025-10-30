import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final int duration;
  final String difficulty;
  final String? imageUrl;
  final VoidCallback onTap;

  const RecipeCard({
    Key? key,
    required this.title,
    required this.duration,
    required this.difficulty,
    this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical:8),
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // dégradé si il y a pas d'image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: imageUrl != null && imageUrl!.isNotEmpty
                  ? Image.network(
                      imageUrl!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return buildPlaceholder(difficulty);
                      },
                    )
                  : buildPlaceholder(difficulty),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 18,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '$duration min',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(width: 16),
                      buildDifficultyBadge(difficulty),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPlaceholder(String difficulty) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(gradient: getGradientForDifficulty(difficulty)),
      child: Center(
        child: Icon(
          Icons.restaurant,
          size: 60,
          color: Colors.white.withOpacity(0.7),
        ),
      ),
    );
  }

  LinearGradient getGradientForDifficulty(String difficulty) {
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

  Widget buildDifficultyBadge(String difficulty) {
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
      padding: const EdgeInsets.symmetric(horizontal:50, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        difficulty,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

