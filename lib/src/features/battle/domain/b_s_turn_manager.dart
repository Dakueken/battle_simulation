import 'package:battle_simulation/src/common/models/monster.dart';
import 'package:flutter/material.dart';

class BSTurnManager extends ChangeNotifier {
  List<dynamic> turnOrder;
  int _currentIndex = 0;
  String? turnMessage;

  final void Function(String)? onLog;

  BSTurnManager({required this.turnOrder, this.onLog});

  dynamic get current => turnOrder.isNotEmpty ? turnOrder[_currentIndex] : null;

  void nextTurn() {
    if (turnOrder.isEmpty) return;
    _currentIndex = (_currentIndex + 1) % turnOrder.length;
    notifyListeners();
  }

  void removeFirst() {
    if (turnOrder.isEmpty) return;
    final participant = current;

    if (participant != null && onLog != null) {
      final name = participant.name;
      onLog!("$name has taken its move.");
    }

    turnOrder.removeAt(0);
    _currentIndex = 0;
    notifyListeners();
  }

  Future<void> handleMonsterTurn() async {
    if (turnOrder.isEmpty) return;

    final participant = current;
    if (participant is Monster) {
      turnMessage = "Monster is taking its move...";
      notifyListeners();

      if (onLog != null) {
        onLog!("${participant.name} is taking its move!");
      }

      await Future.delayed(Duration(seconds: 2));

      turnMessage = null;
      removeFirst();
    }
  }

  void reset(List<dynamic> newOrder) {
    turnOrder = newOrder;
    _currentIndex = 0;
    turnMessage = null;
    notifyListeners();
  }
}
