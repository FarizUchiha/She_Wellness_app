import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Delay to simulate loading
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login'); // Navigate to the login page
    });

    return Scaffold(
      backgroundColor: Color(0xFFFF6F91), // Pink background
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Illustration Placeholder
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Color(0xFFFF8FA3), // Slightly lighter pink
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.self_improvement,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Title
              Text(
                'SHE',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
              Text(
                'WELLNESS CLUB',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}