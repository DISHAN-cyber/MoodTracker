import 'package:flutter/material.dart';
import 'package:mood_tracker/pages/WelcomePage.dart';
import 'package:mood_tracker/pages/home_page.dart';
import 'package:mood_tracker/pages/mood_selection_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
      routes: {
        MyHomePage.routeName: (context) => const MyHomePage(title: 'Home'),
        MoodSelectionPage.routeName: (context) => const MoodSelectionPage(),
      },
    );
  }
}
