import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login.dart';
import 'dashboard.dart';
import 'profile.dart';
import 'todolist.dart';
import 'product_catalog.dart';
import 'orders.dart';
import 'cart_manager.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CartManager())],
      child: MaterialApp(
        title: 'Practical 7 - Product Catalog App',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/dashboard': (context) => DashboardScreen(),
          '/profile': (context) => ProfileScreen(),
          '/todolist': (context) => TodoListScreen(),
          '/catalog': (context) => const ProductCatalogScreen(),
          '/orders': (context) => const OrdersPage(),
        },
      ),
    );
  }
}
