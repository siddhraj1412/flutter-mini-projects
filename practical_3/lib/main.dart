//PRACTICAL 3 : Multiscreen Application Login and dashboard and profile and
//                Temperature convertor app
import 'package:flutter/material.dart';
import 'login.dart';
import 'dashboard.dart';
import 'profile.dart';
import 'todolist.dart';

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
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/profile': (context) => ProfileScreen(),
        '/todolist': (context) => TodoListScreen(),
      },
    );
  }
}

