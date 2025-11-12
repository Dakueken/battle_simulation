import 'package:battle_simulation/src/common/data/mock_data/messages.dart';
import 'package:flutter/material.dart';

class BSBattleLog extends StatefulWidget {
  const BSBattleLog({super.key});

  @override
  _BSBattleLogState createState() => _BSBattleLogState();
}

class _BSBattleLogState extends State<BSBattleLog> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant BSBattleLog oldWidget) {
    super.didUpdateWidget(oldWidget);
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.all(10),
        color: Color.fromARGB(152, 0, 0, 0),
        width: 450,
        height: 150,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 5, 30, 5),
          controller: _scrollController,
          child: Text(
            messages.join('\n'),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
