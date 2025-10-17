import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final String title;
  final bool showBackButton;

  const HeaderSection({
    Key? key,
    required this.title,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      width: double.infinity,
      color: Colors.orange,
      child: Row(
        children: [
          if (showBackButton)
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).maybePop();
              },
            )
          else
            const SizedBox(width: 48),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 48),
        ],
      ),
    );
  }
}

