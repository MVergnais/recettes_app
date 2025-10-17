import 'package:flutter/material.dart';

class NavigationBarApp extends StatefulWidget {
  const NavigationBarApp({super.key});

  @override
  State<NavigationBarApp> createState() => _NavigationBarAppState();
}

class _NavigationBarAppState extends State<NavigationBarApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/detail');
        break;
      case 2:
        Navigator.pushNamed(context, '/add');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home)),
        BottomNavigationBarItem(
          label: 'Détail de la recette',
          icon: Icon(Icons.document_scanner),
        ),
        BottomNavigationBarItem(
          label: 'Ajouter une recette',
          icon: Icon(Icons.add_circle),
        ),
      ],
    );
  }
}
