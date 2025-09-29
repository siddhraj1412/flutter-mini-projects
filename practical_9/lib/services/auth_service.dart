import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // IMPORTANT: Use 10.0.2.2 for Android Emulator, or your machine's IP for a physical device.
  static const String _baseUrl = 'http://10.0.2.2:5000/api/auth';

  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      print('Login response status: ${response.statusCode}');
      print('Login response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // Check if response contains required fields
        if (responseData['token'] == null) {
          print('Error: Token is null in response');
          return {
            'success': false,
            'message': 'Invalid response: missing token',
          };
        }

        if (responseData['user'] == null) {
          print('Error: User object is null in response');
          return {
            'success': false,
            'message': 'Invalid response: missing user data',
          };
        }

        String token = responseData['token'];
        Map<String, dynamic> user = responseData['user'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        await prefs.setString('userName', user['name']);
        await prefs.setString('userEmail', user['email']);
        await prefs.setString('userId', user['id']);

        return {'success': true, 'message': 'Login successful'};
      } else {
        final responseData = jsonDecode(response.body);
        String errorMessage = responseData['msg'] ?? 'Login failed';
        print('Login failed with status ${response.statusCode}: $errorMessage');
        return {'success': false, 'message': errorMessage};
      }
    } catch (e) {
      print('Login error: $e');
      return {'success': false, 'message': 'Network error: $e'};
    }
  }

  Future<bool> register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'password': password}),
    );

    return response.statusCode == 201; // 201 Created
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('userName');
    await prefs.remove('userEmail');
    await prefs.remove('userId');
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') != null;
  }

  Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userName');
  }

  Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userEmail');
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }
}
