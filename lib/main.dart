import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_bot/screens/auth/login_screen.dart';
import 'package:mi_bot/screens/auth/onboarding_screen.dart';
import 'package:mi_bot/screens/home/home_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_bot/services/environment.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future main() async {
  await dotenv.load(fileName: Environment.fileName);

  // Khởi tạo FlutterSecureStorage
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  // Ensure Flutter is initialized before setting system UI
  WidgetsFlutterBinding.ensureInitialized();
  // Set status bar icons to dark (black) or light (white) based on your app's theme
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make status bar transparent
      statusBarIconBrightness:
          Brightness.dark, // Dark icons for light background
      statusBarBrightness: Brightness.light, // iOS status bar brightness
    ),
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Bot',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        fontFamily: GoogleFonts.getFont('Inter').fontFamily,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark, // Dark icons
            statusBarBrightness: Brightness.light, // iOS
          ),
        ),
      ),
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const LoginScreen(),
        '/login': (context) => const OnboardingScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
