import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const BankNusantaraApp());
}

class BankNusantaraApp extends StatelessWidget {
  const BankNusantaraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bank Nusantara',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFFFFF8E1),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6D4C41), // coklat elegan
          primary: const Color(0xFF6D4C41),
          secondary: const Color(0xFFF8E9D2),
        ),
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
