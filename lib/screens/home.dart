
import 'package:flutter/material.dart';
import '../widgets/header_section.dart';
import '../widgets/navigation_bar_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HeaderSection(title: 'Mes recettes'),
            SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarApp(),
    );
  }
}
