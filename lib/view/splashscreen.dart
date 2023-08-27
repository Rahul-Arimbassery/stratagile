import 'package:flutter/material.dart';
import 'package:stratagile/view/homescreen.dart';

// SplashScreen widget displayed at app startup
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Delay navigation to home screen by 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      // Navigate to HomePage and replace SplashScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });

    // Return SafeArea with Scaffold containing centered content
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "TodoApp",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Text(
                'Assignment by Stratagile',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 128, 127, 127)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
