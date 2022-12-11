import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:semasma/screens/app_splash_screen.dart';
import 'package:semasma/utils/app_theme.dart';

import 'screens/home_screen.dart';
import 'screens/previsao_tempo.dart';
import 'utils/app_constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final bool darkTheme = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '$appName${!isMobile ? ' ${platformName()}' : ''}',
      theme: AppThemeData.lightTheme,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const AppSplashScreen(),
            );
          case '/home':
            return MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            );
          case '/previsao_tempo':
            return MaterialPageRoute(
              builder: (context) => const PrevisaoTempo(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const AppSplashScreen(),
            );
        }
      },
    );
  }
}
