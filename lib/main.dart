import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/splash.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/auth/forgot_password_screen.dart';
import 'screens/home/homepage.dart';
import 'screens/contact_us/contact_us_screen.dart';
import 'screens/faq/faq_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://lozorotwzevwvajaemqj.supabase.co', // Replace with your Supabase Project URL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxvem9yb3R3emV2d3ZhamFlbXFqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc0MzUyNjcsImV4cCI6MjA1MzAxMTI2N30.InfIJYLgJ0KPDblRZU6K4HkIo0AZqLkU2zDOOrNIPaE', // Replace with your Supabase anon key
  );


  runApp(SheWellnessApp());
}

class SheWellnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',  // Start with splash screen
      routes: {
        '/': (context) => SplashScreen(),  // Splash screen
        '/login': (context) => LoginScreen(),  // Login screen
        '/signup': (context) => SignUpScreen(),  // Sign-up screen
        '/forgot': (context) => ForgotPasswordScreen(),  // Forgot password screen
        '/home': (context) => HomePage(),  // Home page
        '/faq': (context) => FAQScreen(),  // FAQ screen
        '/contact': (context) => ContactUsScreen(),  // Contact us screen
        
      },
    );
  }
}
