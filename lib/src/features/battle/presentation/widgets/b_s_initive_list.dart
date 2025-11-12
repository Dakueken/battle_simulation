import 'package:flutter/material.dart';

class BSInitiativeList extends StatelessWidget {
  final List<dynamic> turnOrder;
  final int activeIndex; // index of current turn

  const BSInitiativeList({
    super.key,
    required this.turnOrder,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(100, 0, 0, 0),
      width: 72,
      child: ListView.builder(
        itemCount: turnOrder.length,
        itemBuilder: (context, index) {
          final participant = turnOrder[index];

          final isActive = index == activeIndex;
          final borderColor = isActive
              ? Colors.yellowAccent
              : Color.fromARGB(180, 255, 193, 7);
          final borderWidth = isActive ? 3.0 : 1.0;

          return Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
              height: 48,
              width: 72,
              decoration: BoxDecoration(
                color: isActive
                    ? Color.fromARGB(200, 100, 0, 200)
                    : Color.fromARGB(180, 47, 0, 117),
                border: Border.all(width: borderWidth, color: borderColor),
              ),
              child: Image.asset(
                participant.image,
                alignment: Alignment.center,
                fit: BoxFit.fitHeight,
              ),
            ),
          );
        },
      ),
    );
  }
}
