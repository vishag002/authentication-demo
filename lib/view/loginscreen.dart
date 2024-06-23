import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_authentication_demo/view/forgotpass.dart';
import 'package:login_authentication_demo/view/registerscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  //sign in function
  /* Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      // Handle successful login here
    } catch (e) {
      // Handle errors here
      print("Error: $e");
    }
  } */
  //
  signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text("Login Screen"),
        centerTitle: true,
      ), */
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.amber,
            child: Stack(
              children: [
                Positioned(
                  left: -110,
                  top: -50,
                  child: CircleAvatar(
                    radius: 120,
                    backgroundColor: Colors.blue.shade900,
                  ),
                ),
                Positioned(
                  left: 70,
                  top: -150,
                  child: CircleAvatar(
                    radius: 120,
                    backgroundColor: Colors.blue.shade900,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Text(
              "Login",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                // height: 150,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(100),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          border: InputBorder.none,
                          hintText: "email",
                          icon: Icon(Icons.email),
                        ),
                      ),
                    ),
                    Center(
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: TextFormField(
                        controller: passController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          border: InputBorder.none,
                          hintText: "password",
                          icon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  right: -5,
                  top: 45,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
