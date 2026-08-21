import 'package:flutter/material.dart';
import 'package:four_emojis_one_word/models/game_data.dart';
import 'package:four_emojis_one_word/models/level.dart';

class GameProvider with ChangeNotifier {
  int _currentLevelIndex = 0;
  String _userInput = '';
  int _score = 0;
  bool _isGameOver = false;

  int get currentLevelIndex => _currentLevelIndex;
  String get userInput => _userInput;
  int get score => _score;
  bool get isGameOver => _isGameOver;

  Level get currentLevel {
    return GameData.levels[_currentLevelIndex];
  }

  int get totalLevels => GameData.levels.length;

  void updateUserInput(String value) {
    _userInput = value.toUpperCase();
    notifyListeners();
  }

  bool submitAnswer() {
    final correctWord = currentLevel.word.toUpperCase();
    if (_userInput.trim() == correctWord) {
      _score += 10;
      _userInput = '';
      _nextLevel();
      notifyListeners();
      return true;
    } else {
      _userInput = '';
      notifyListeners();
      return false;
    }
  }

  void _nextLevel() {
    if (_currentLevelIndex < totalLevels - 1) {
      _currentLevelIndex++;
    } else {
      _isGameOver = true;
    }
  }

  void resetGame() {
    _currentLevelIndex = 0;
    _userInput = '';
    _score = 0;
    _isGameOver = false;
    notifyListeners();
  }
}