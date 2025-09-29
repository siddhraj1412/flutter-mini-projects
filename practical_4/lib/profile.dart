import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final userName = args?['name'] ?? 'User';
    final userEmail = args?['email'] ?? 'No Email';

    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Name: $userName'), Text('Email: $userEmail')],
        ),
      ),
    );
  }
}
