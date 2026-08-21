import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  final bool isCorrect;
  final String message;
  final VoidCallback onContinue;

  const ResultDialog({
    super.key,
    required this.isCorrect,
    required this.message,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(
        isCorrect ? '🎉 Correct!' : '❌ Oops!',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isCorrect ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black87,
        ),
      ),
      actions: [
        Center(
          child: ElevatedButton(
            onPressed: onContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: isCorrect 
                  ? Theme.of(context).colorScheme.primary 
                  : Colors.grey.shade700,
              foregroundColor: Colors.white,
            ),
            child: const Text(
              'CONTINUE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}