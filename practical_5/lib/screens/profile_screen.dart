import 'package:flutter/material.dart';
import '../models/user_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'User Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            _buildProfileTile(
              'Name',
              UserData.name.isNotEmpty ? UserData.name : 'Not set',
            ),
            const SizedBox(height: 16),

            _buildProfileTile(
              'Email',
              UserData.email.isNotEmpty ? UserData.email : 'Not set',
            ),
            const SizedBox(height: 16),

            _buildProfileTile(
              'Branch',
              UserData.branch.isNotEmpty ? UserData.branch : 'Not set',
            ),
            const SizedBox(height: 16),

            _buildProfileTile(
              'Phone',
              UserData.phoneNumber.isNotEmpty
                  ? UserData.phoneNumber
                  : 'Not set',
            ),
            const SizedBox(height: 16),

            _buildProfileTile(
              'City',
              UserData.city.isNotEmpty ? UserData.city : 'Not set',
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                UserData.logout();
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTile(String title, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(value),
        ],
      ),
    );
  }
}
