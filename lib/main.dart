import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/pages/home.dart';
import 'package:to_do/providers/task_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 36, 36, 36)
      ),
      home: Home(),
    );
  }
}