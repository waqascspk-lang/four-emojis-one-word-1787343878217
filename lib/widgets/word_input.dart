import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:four_emojis_one_word/providers/game_provider.dart';

class WordInput extends StatelessWidget {
  final TextEditingController controller;

  const WordInput({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final gameProvider = context.read<GameProvider>();

    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      textCapitalization: TextCapitalization.characters,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: 4,
      ),
      decoration: InputDecoration(
        hintText: 'TYPE YOUR ANSWER',
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontWeight: FontWeight.normal,
          letterSpacing: 1,
          fontSize: 16,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      ),
      onChanged: (value) => gameProvider.updateUserInput(value),
    );
  }
}