import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_authentication_demo/view/acc_delete_screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final User? user = FirebaseAuth.instance.currentUser;

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  deletaAcc() async {
    // await FirebaseAuth.instance.delete;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text(
          "HomeScreen",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ), */
      backgroundColor: Colors.white,
      body: FutureBuilder<DocumentSnapshot>(
        future:
            FirebaseFirestore.instance.collection('users').doc(user!.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('User data not found'));
          }

          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          String email = user!.email!;
          String name = data['name'];
          int age = data['age'];

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Column(
                children: [
                  Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      color: Colors.orange.shade900,
                    ),
                    child: Center(
                      child: Text(
                        "Welcome User",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      color: Colors.blue.shade900,
                    ),
                    child: Center(
                      child: Text(
                        'Name: $name',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue.shade900,
                    ),
                    child: Center(
                      child: Text(
                        'Age: $age',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                      color: Colors.blue.shade900,
                    ),
                    child: Center(
                      child: Text(
                        "email : $email",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 200,
                width: double.infinity,
                //color: Colors.amber,
                child: Stack(
                  children: [
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
          );
          ////
          /* Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email: $email', style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                Text('Name: $name', style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                Text('Age: $age', style: TextStyle(fontSize: 20)),
              ],
            ),
          ); */
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: Colors.white,
            onPressed: () {
              //
              Get.to(() => AccDeleteScreen());
            },
            child: Icon(
              Icons.delete,
              color: Colors.black,
              size: 30,
            ),
          ),
          //
          SizedBox(width: 10),
          FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: Colors.white,
            onPressed: () {
              signOut();
            },
            child: Icon(
              Icons.logout,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
