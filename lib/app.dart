import 'package:flutter/material.dart';
import 'package:pokedex/features/home/presentation/ui/screens/home.dart';
import 'package:pokedex/features/splash/presentation/ui/screens/splash.dart';
import 'package:pokedex/src/res/theme/app_theme.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      routes: {
        /// '/' is the default route
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
