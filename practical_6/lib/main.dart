import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'services/preferences_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;
  bool _isLoggedIn = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAppState();
  }

  Future<void> _loadAppState() async {
    final prefsService = PreferencesService();
    final isDarkMode = await prefsService.isDarkMode();
    final isLoggedIn = await prefsService.isLoggedIn();

    setState(() {
      _isDarkMode = isDarkMode;
      _isLoggedIn = isLoggedIn;
      _isLoading = false;
    });
  }

  void _toggleTheme(bool isDark) {
    setState(() {
      _isDarkMode = isDark;
    });
  }

  void _onLoginStateChanged(bool isLoggedIn) {
    setState(() {
      _isLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
      ),
      home: _isLoggedIn
          ? DashboardScreen(
              onThemeToggle: _toggleTheme,
              isDarkMode: _isDarkMode,
              onLogout: () => _onLoginStateChanged(false),
            )
          : LoginScreen(onLogin: () => _onLoginStateChanged(true)),
    );
  }
}
