import '../recipe.dart';

final List<Recipe> recipesData = [
  Recipe(
    id: '1',
    title: 'Tarte aux pommes',
    duration: 45,
    difficulty: 'Difficile',
    ingredients: [
      '1 pâte feuilletée',
      '4 pommes',
      '50g de sucre',
      '30g de beurre',
      '1 œuf',
    ],
    steps: [
      'Préchauffer le four à 180°C',
      'Éplucher et couper les pommes en fines tranches',
      'Étaler la pâte dans un moule',
      'Disposer les pommes sur la pâte',
      'Saupoudrer de sucre et ajouter des noisettes de beurre',
      'Enfourner pendant 30 minutes',
    ],
    imageUrl:
        'https://images.unsplash.com/photo-1535920527002-b35e96722eb9?w=400',
  ),
  Recipe(
    id: '2',
    title: 'Salade César',
    duration: 15,
    difficulty: 'Facile',
    ingredients: [
      '1 laitue romaine',
      '100g de poulet grillé',
      '50g de parmesan',
      'Croûtons',
      'Sauce César',
    ],
    steps: [
      'Laver et couper la salade',
      'Couper le poulet en morceaux',
      'Mélanger tous les ingrédients',
      'Ajouter la sauce César',
      'Parsemer de parmesan et de croûtons',
    ],
    imageUrl: 'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=400',
  ),
  Recipe(
    id: '3',
    title: 'Pâtes Carbonara',
    duration: 20,
    difficulty: 'Facile',
    ingredients: [
      '400g de pâtes',
      '200g de lardons',
      '4 œufs',
      '100g de parmesan',
      'Poivre noir',
    ],
    steps: [
      'Faire cuire les pâtes al dente',
      'Faire revenir les lardons',
      'Battre les œufs avec le parmesan',
      'Mélanger les pâtes égouttées avec les lardons',
      'Hors du feu, ajouter le mélange œufs-parmesan',
      'Bien mélanger et poivrer généreusement',
    ],
    imageUrl:
        'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=400',
  ),
  Recipe(
    id: '4',
    title: 'Poulet rôti',
    duration: 90,
    difficulty: 'Moyen',
    ingredients: [
      '1 poulet entier (1,5 kg)',
      '2 citrons',
      '4 gousses d\'ail',
      'Herbes de Provence',
      '50g de beurre',
      'Sel et poivre',
    ],
    steps: [
      'Préchauffer le four à 200°C',
      'Farcir le poulet avec citron et ail',
      'Badigeonner de beurre fondu',
      'Assaisonner généreusement',
      'Enfourner pendant 1h30',
      'Arroser régulièrement avec le jus de cuisson',
    ],
    imageUrl:
        'https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=400',
  ),
];
