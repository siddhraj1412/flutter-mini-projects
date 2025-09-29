//PRACTICAL 5 : Student Records App with SQLite CRUD Operations
// By 23AIML010 OM CHOKSI
import 'package:flutter/material.dart';
import 'screens/signup_screen.dart';
import 'screens/login_screen.dart';
import 'screens/student_list_screen.dart';
import 'screens/add_edit_student_screen.dart';
import 'screens/profile_screen.dart';
import 'models/user_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserData.loadFromPrefs();
  final initial = UserData.isLoggedIn ? '/students' : '/signup';
  runApp(MyApp(initialRoute: initial));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Records App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: initialRoute,
      routes: {
        '/signup': (context) => const SignupScreen(),
        '/login': (context) => const LoginScreen(),
        '/students': (context) => const StudentListScreen(),
        '/add-student': (context) => const AddEditStudentScreen(),
        '/edit-student': (context) => const AddEditStudentScreen(isEdit: true),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
