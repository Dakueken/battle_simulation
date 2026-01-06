import 'package:battle_simulation/src/common/models/monster.dart';
import 'package:flutter/material.dart';

class BSTurnManager {
  final ValueNotifier<List<dynamic>> turnOrderNotifier;
  final ValueNotifier<dynamic> currentNotifier;
  final ValueNotifier<String?> turnMessageNotifier;

  final void Function(String)? onLog;

  int _currentIndex = 0;

  BSTurnManager({required List<dynamic> turnOrder, this.onLog})
    : turnOrderNotifier = ValueNotifier(turnOrder),
      currentNotifier = ValueNotifier(
        turnOrder.isNotEmpty ? turnOrder.first : null,
      ),
      turnMessageNotifier = ValueNotifier(null);

  List<dynamic> get turnOrder => turnOrderNotifier.value;
  dynamic get current => currentNotifier.value;

  void _updateCurrent() {
    if (turnOrder.isNotEmpty) {
      currentNotifier.value = turnOrder[_currentIndex];
    } else {
      currentNotifier.value = null;
    }
  }

  void nextTurn() {
    if (turnOrder.isEmpty) return;
    _currentIndex = (_currentIndex + 1) % turnOrder.length;
    _updateCurrent();
  }

  void removeFirst() {
    if (turnOrder.isEmpty) return;
    final participant = current;

    if (participant != null && onLog != null) {
      final name = participant.name;
      onLog!("$name has taken its move.");
    }

    final newList = List<dynamic>.from(turnOrder)..removeAt(0);
    newList.add(participant);
    turnOrderNotifier.value = newList;
    _currentIndex = 0;
    _updateCurrent();
  }

  Future<void> handleMonsterTurn() async {
    if (turnOrder.isEmpty) return;
    final participant = current;
    if (participant is Monster) {
      turnMessageNotifier.value = "Monster is taking its move...";

      if (onLog != null) {
        onLog!("${participant.name} is taking its move!");
      }

      await Future.delayed(const Duration(seconds: 2));

      turnMessageNotifier.value = null;
      removeFirst();
    }
  }

  void reset(List<dynamic> newOrder) {
    turnOrderNotifier.value = newOrder;
    _currentIndex = 0;
    _updateCurrent();
    turnMessageNotifier.value = null;
  }

  void dispose() {
    turnOrderNotifier.dispose();
    currentNotifier.dispose();
    turnMessageNotifier.dispose();
  }
}
