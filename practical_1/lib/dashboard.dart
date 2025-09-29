import "package:flutter/material.dart";

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final userName = args?['name'] ?? 'User';

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard Page')),
     
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Hi $userName',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
     
            const SizedBox(height: 20),
     
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Welcome $userName')));
                Navigator.pushNamed(
                  context,
                  '/profile',
                  arguments: {
                    'name': userName,
                    'email': args?['email'] ?? 'No Email',
                  },
                );
              },
     
              child: const Text('Go to Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
