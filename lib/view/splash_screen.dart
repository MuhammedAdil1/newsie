import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //     const Duration(seconds: 3),
  //         () => Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => const HomePage()),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:  Color(0xFFE5D9F2),
      body: Stack(
        children: [
          // Gradient Background
          Positioned.fill(
            top: 140,
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/newsieSplash.png",

              ),
            ),
          ),

          // Welcome Text
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20
              ),
              child: Text(
                "Welcome to Newsie\n breaking news, exclusive stories, and personalized updates !",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Monument Extended Regular',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3E3835),
                  height: 2.2,
                ),
              ),
            ),
          ),
          SpinKitCircle(
            color: Color(0xff3E3835),size: 40,
          ),
        ],
      ),
    );
  }
}