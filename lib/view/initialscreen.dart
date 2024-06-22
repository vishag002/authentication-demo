import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_authentication_demo/view/homescreen.dart';
import 'package:login_authentication_demo/view/loginscreen.dart';

class Initialscreen extends StatefulWidget {
  const Initialscreen({super.key});

  @override
  State<Initialscreen> createState() => _InitialscreenState();
}

class _InitialscreenState extends State<Initialscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Homescreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
