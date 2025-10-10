import 'package:battle_simulation/battle_screen.dart/character_screen.dart';
import 'package:battle_simulation/shared/theme.dart';
import 'package:battle_simulation/start/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainScreen(), theme: AppTheme.lightTheme);
  }
}
