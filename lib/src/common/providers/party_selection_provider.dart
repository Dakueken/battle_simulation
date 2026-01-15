import 'package:riverpod/riverpod.dart';

final partySelectionProvider =
    NotifierProvider<PartySelectionNotifier, List<bool>>(
      PartySelectionNotifier.new,
    );

class PartySelectionNotifier extends Notifier<List<bool>> {
  @override
  List<bool> build() {
    return List.generate(10, (_) => false); // adjust length to your characters
  }

  void toggle(int index, bool value) {
    final updated = [...state];
    updated[index] = value;
    state = updated;
  }
}
