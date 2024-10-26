import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'screens/screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('unoDareRuleBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Uno Dare Randomizer',
      home: HomeScreen(),
    );
  }
}
