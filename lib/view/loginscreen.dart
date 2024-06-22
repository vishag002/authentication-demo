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
      appBar: AppBar(
        title: Text("Login Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: "email"),
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: passController,
              decoration: InputDecoration(hintText: "password"),
            ),
            SizedBox(height: 50),
            Center(
              child: TextButton(
                  onPressed: () {
                    signIn();
                  },
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.orange)),
                  child: Text(
                    "  login  ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ));
                  },
                  child: Text(
                    "New User?",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(ForgotPass());
                    /* Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPass(),
                        )); */
                  },
                  child: Text(
                    "forgot password?",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
