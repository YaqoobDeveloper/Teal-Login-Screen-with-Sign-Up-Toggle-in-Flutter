import 'package:flutter/material.dart';

import 'screens/welcome_back_login_screen.dart';
import 'theme/welcome_colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome Back',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: WelcomeColors.mint,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: WelcomeColors.background,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: WelcomeColors.mint.withValues(alpha: 0.35),
          selectionHandleColor: WelcomeColors.mint,
        ),
        // No Material ripple, highlight or hover anywhere in the app.
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      home: const WelcomeBackLoginScreen(),
    );
  }
}
