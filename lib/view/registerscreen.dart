// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_authentication_demo/view/initialscreen.dart';
import 'package:login_authentication_demo/view/loginscreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  signUp() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': nameController.text.trim(),
        'age': int.parse(ageController.text.trim()),
      });
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
    /* await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passController.text);

    /* addUserDetails(nameController.text, int.parse(ageController.text),
        emailController.text); */

    await FirebaseFirestore.instance.collection('users').add({
      'name': nameController.text,
      'age': int.parse(ageController.text),
      'email': emailController.text,
    }); */

    Get.offAll(Initialscreen());
    Get.snackbar(
      'Registered Successfully',
      'Account registered successfully',
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  //add users
  /* Future addUserDetails(String namee, int agee, String eemail) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': namee,
      'age': agee,
      'email': eemail,
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text("Register Screen"),
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
                      backgroundColor: Colors.orange.shade900,
                    ),
                  ),
                  Positioned(
                    left: 40,
                    top: -150,
                    child: CircleAvatar(
                      radius: 110,
                      backgroundColor: Colors.orange.shade900,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Center(
              child: Text(
                "Register",
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
                                  controller: nameController,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(15),
                                    border: InputBorder.none,
                                    hintText: "name",
                                    icon: Icon(Icons.person),
                                  ),
                                ),
                              ),
                              const Center(
                                child: Divider(
                                  color: Colors.black,
                                  height: 10,
                                  endIndent: 10,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: ageController,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    border: InputBorder.none,
                                    hintText: "age",
                                    icon: Icon(Icons.person_4_outlined),
                                  ),
                                ),
                              ),

                              //

                              const Center(
                                child: Divider(
                                  color: Colors.black,
                                  height: 10,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    border: InputBorder.none,
                                    hintText: "email",
                                    icon: Icon(Icons.email),
                                  ),
                                ),
                              ),

                              //

                              const Center(
                                child: Divider(
                                  color: Colors.black,
                                  height: 10,
                                  endIndent: 10,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: TextFormField(
                                  controller: passController,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(15),
                                    border: InputBorder.none,
                                    hintText: "password",
                                    icon: Icon(Icons.lock),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  right: 7,
                  top: 80,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.blue,
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            signUp();
                          },
                          icon: Icon(
                            Icons.check,
                            color: Colors.white.withOpacity(.9),
                            size: 45,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            const SizedBox(height: 40),
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
                      Get.to(() => LoginScreen());
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
                          "Login",
                          style: TextStyle(
                            color: Colors.blue,
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
                      backgroundColor: Colors.orange.shade900,
                    ),
                  ),
                  Positioned(
                    bottom: -220,
                    right: -5,
                    child: CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.orange.shade900,
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
