import 'package:flutter/material.dart';

class SuccessMessage extends StatelessWidget {
  final String message;

  const SuccessMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        border: Border(
          left: BorderSide(
            color: Colors.green.shade700,
            width: 4,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.green.shade700,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: Colors.green.shade900,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
