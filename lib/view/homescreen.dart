import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final user = FirebaseAuth.instance.currentUser;
  final userS = "";
  signOut() async {
    await FirebaseAuth.instance.signOut();
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
      body: Column(
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
                    "Welcome User :",
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
                  child: StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(user!.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return Text(
                          "Error: ${snapshot.error}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                      if (!snapshot.hasData || !snapshot.data!.exists) {
                        return Text(
                          "User data not found",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }

                      var userData =
                          snapshot.data!.data() as Map<String, dynamic>;
                      var userName = userData['name'];

                      return Text(
                        "Name: $userName",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
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
                    "email : ${user!.email}",
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: FloatingActionButton(
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
    );
  }
}
