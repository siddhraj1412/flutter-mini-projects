//PRACTICAL 4 : mobile application where users
// navigate through multiple screens like login,
// dashboard, and profile.
//Design a Form-based Registration App with validation
//using TextFormField.
// By 23AIML010 OM CHOKSI

import 'package:flutter/material.dart';
import 'login.dart';
import 'dashboard.dart';
import 'profile.dart';
import 'todolist.dart';
import 'feedback.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/registration',
      routes: {
        '/registration': (context) => RegistrationScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/profile': (context) => ProfileScreen(),
        '/todolist': (context) => TodoListScreen(),
        '/feedback': (context) => FeedbackScreen(),
      },
    );
  }
}
