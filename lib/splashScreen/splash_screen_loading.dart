import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tv_shows/authentication/login_screen.dart';

class LoadingSplashScreen extends StatefulWidget {
  const LoadingSplashScreen({Key? key}) : super(key: key);

  @override
  State<LoadingSplashScreen> createState() => _LoadingSplashScreenState();
}

class _LoadingSplashScreenState extends State<LoadingSplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => LoginWithGoogleScreen()));
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color.fromARGB(255, 27, 26, 27),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/logo.png",
              ),
              SizedBox(
                height: 30.0,
              ),
              const Text(
                'TV SHOWS APP ',
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.white60,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'by HanceForth',
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(153, 139, 233, 7),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
