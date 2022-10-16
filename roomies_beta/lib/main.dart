import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const MaterialColor primarySwatchColor = MaterialColor(
    0xFF8dbaf1,
    <int, Color>{
      50: Color(0xFF8dbaf1),
      100: Color(0xFF8dbaf1),
      200: Color(0xFF8dbaf1),
      300: Color(0xFF8dbaf1),
      400: Color(0xFF8dbaf1),
      500: Color(0xFF8dbaf1),
      600: Color(0xFF8dbaf1),
      700: Color(0xFF8dbaf1),
      800: Color(0xFF8dbaf1),
      900: Color(0xFF8dbaf1),
    },
  );

  static const MaterialColor secondarySwatchColor = MaterialColor(
    0xFFf1c48d,
    <int, Color>{
      50: Color(0xFFf1c48d),
      100: Color(0xFFf1c48d),
      200: Color(0xFFf1c48d),
      300: Color(0xFFf1c48d),
      400: Color(0xFFf1c48d),
      500: Color(0xFFf1c48d),
      600: Color(0xFFf1c48d),
      700: Color(0xFFf1c48d),
      800: Color(0xFFf1c48d),
      900: Color(0xFFf1c48d),
    },
  );

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roomies',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: primarySwatchColor)
            .copyWith(secondary: secondarySwatchColor),
        fontFamily: 'Poppins',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (context) => TabsScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => TabsScreen());
      },
    );
  }
}
