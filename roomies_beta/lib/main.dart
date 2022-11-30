import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roomies_beta/screens/houses_screen/create_house_screen.dart';
import 'firebase_options.dart';

import './models/database.dart';
import './models/size_config.dart';
import './providers/house.dart';
import './providers/app_user.dart';
import './screens/tabs_screen.dart';
import './screens/landing_page/create_account_screen.dart';
import './screens/landing_page/signin_screen.dart';
import './screens/introduction_screens/introduction_screen.dart';
import './main_page.dart';
import './screens/houses_screen/my_houses_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
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

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Database appDatabase = Database();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AppUser('', '', '', false, ''),
        ),
      ],
      builder: (context, child) => StreamProvider<House>.value(
        value: appDatabase
            .getHouseData(Provider.of<AppUser>(context).getCurrentHouse),
        initialData: House('', '', []),
        catchError: (_, error) {
          return House(error.toString(), "Loading...", []);
        },
        child: Builder(
          builder: (context) => StreamProvider<List<AppUser>>.value(
            initialData: const [],
            value: appDatabase
                .getUserListData(Provider.of<House>(context).getUsersIds),
            catchError: (_, error) {
              return [
                AppUser(
                  error.toString(),
                  error.toString(),
                  error.toString(),
                  false,
                  error.toString(),
                )
              ];
            },
            child: child,
          ),
        ),
      ),
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
        home: const MainPage(),
        routes: {
          SigninScreen.routeName: (context) => const SigninScreen(),
          CreateAccountScreen.routeName: (context) =>
              const CreateAccountScreen(),
          IntroductionScreen.routeName: (context) => const IntroductionScreen(),
          MyHousesScreen.routeName: (context) => const MyHousesScreen(),
          CreateHouseScreen.routeName: (context) => const CreateHouseScreen(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => const TabsScreen());
        },
      ),
    );
  }
}
