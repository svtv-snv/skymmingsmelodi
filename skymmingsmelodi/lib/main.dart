import 'package:flutter/material.dart';
import 'screens/voting_screen.dart';
import 'core/theme.dart';

void main() {
  runApp(const SkymmingsmelodiApp());
}

class SkymmingsmelodiApp extends StatelessWidget {
  const SkymmingsmelodiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skymmingsmelodi',
      theme: appTheme,
      home: VotingScreen(),
    );
  }
}