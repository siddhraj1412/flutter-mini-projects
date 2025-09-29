// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:practical_3/login.dart';

void main() {
  testWidgets('Login screen loads', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
