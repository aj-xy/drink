import 'package:cocktail/firstpage.dart';
import 'package:cocktail/providerclass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TextProvider(),
        child: MaterialApp(
          home: Scaffold(
            body: Center(child: home()),
          ),
        ));
  }
}
