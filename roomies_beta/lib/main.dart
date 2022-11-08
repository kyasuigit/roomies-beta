import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'providers/user.dart';
import './screens/tabs_screen.dart';
import './screens/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
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

  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late User appUser;

  @override
  void initState() {
    var uuid = Uuid();
    String uniqueId = uuid.v4();

    appUser = User('kyasui', uniqueId, 'Kohei');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => appUser),
      ],
      child: MaterialApp(
        title: 'Roomies',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: MyApp.primarySwatchColor)
                  .copyWith(secondary: MyApp.secondarySwatchColor),
          fontFamily: 'Poppins',
          textTheme: ThemeData.light().textTheme.copyWith(
                titleMedium: const TextStyle(
                  fontSize: 20,
                ),
              ),
        ),
        routes: {
          '/': (context) => AuthScreen(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => const TabsScreen());
        },
      ),
    );
  }
}
