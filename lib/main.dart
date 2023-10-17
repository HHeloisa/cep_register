import 'package:cep_register/constants/string.dart';
import 'package:cep_register/pages/home.page.dart';
import 'package:flutter/material.dart';

import 'pages/about.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        backgroundColor: Colors.grey[300],
      ),
      routes: {
        "/about": (context) => const AboutPage(),
        "/home": (context) => const HomePage(),
      },
      home: const HomePage(currentIndex: 0),
    );
  }
}
