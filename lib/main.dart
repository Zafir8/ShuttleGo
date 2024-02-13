import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For using SystemUiOverlayStyle
import 'screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Added Key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShuttleGo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.system,
      home: const LoginPage(),
    );
  }
}
