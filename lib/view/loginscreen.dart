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

  signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passController.text);
    Get.snackbar(
      'Success',
      'Logged in successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /* appBar: AppBar(
        title: Text("Login Screen"),
        centerTitle: true,
      ), */
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              //color: Colors.amber,
              child: Stack(
                children: [
                  Positioned(
                    left: -110,
                    top: -70,
                    child: CircleAvatar(
                      radius: 110,
                      backgroundColor: Colors.blue.shade900,
                    ),
                  ),
                  Positioned(
                    left: 40,
                    top: -150,
                    child: CircleAvatar(
                      radius: 110,
                      backgroundColor: Colors.blue.shade900,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Center(
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // height: 150,
                          width: 350,
                          decoration: BoxDecoration(
                            boxShadow: [
                              const BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: BorderSide.strokeAlignOutside,
                                  offset: Offset(5, 5),
                                  spreadRadius: 0)
                            ],
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black.withOpacity(.3),
                              strokeAlign: BorderSide.strokeAlignOutside,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(100),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(20),
                                    border: InputBorder.none,
                                    hintText: "email",
                                    icon: Icon(Icons.email),
                                  ),
                                ),
                              ),
                              const Center(
                                child: Divider(
                                  color: Colors.black,
                                  height: 15,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: TextFormField(
                                  controller: passController,
                                  decoration: const InputDecoration(
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
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(const ForgotPass());
                            },
                            child: Text("Forgot Password?",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(.5),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Positioned(
                  right: 7,
                  top: 30,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.blue,
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            signIn();
                          },
                          icon: Icon(
                            Icons.arrow_right_alt_sharp,
                            color: Colors.white.withOpacity(.9),
                            size: 55,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            const SizedBox(height: 40),
            Container(
              height: 200,
              width: double.infinity,
              //color: Colors.amber,
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      //Get.to(const RegisterScreen());
                      Get.to(() => RegisterScreen());
                    },
                    child: Container(
                      height: 65,
                      width: 120,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.3),
                                blurRadius: .1,
                                offset: const Offset(5, 5),
                                spreadRadius: .1)
                          ],
                          border: Border.all(
                            color: Colors.black26,
                            width: 2,
                          ),
                          color: Colors.white,
                          borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(60),
                          )),
                      child: const Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -160,
                    child: CircleAvatar(
                      radius: 120,
                      backgroundColor: Colors.blue.shade900,
                    ),
                  ),
                  Positioned(
                    bottom: -220,
                    right: -5,
                    child: CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.blue.shade900,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
