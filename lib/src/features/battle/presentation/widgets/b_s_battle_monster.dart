import 'package:flutter/material.dart';

class BSBattleMonster extends StatelessWidget {
  const BSBattleMonster({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 350,
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 100,
                height: 20,
                child: LinearProgressIndicator(
                  value: 10 / 120,
                  backgroundColor: Colors.red,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              SizedBox(
                height: 140,
                width: 200,
                child: Image.asset(
                  "lib/assets/monster/orange/idle/frame-1.png",
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 350,
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 100,
                height: 20,
                child: LinearProgressIndicator(
                  value: 40 / 120,
                  backgroundColor: Colors.red,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              SizedBox(
                height: 140,
                width: 200,
                child: Image.asset(
                  "lib/assets/monster/green/idle/frame-1.png",
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
