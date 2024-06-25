import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'initialscreen.dart';

class AccDeleteScreen extends StatefulWidget {
  const AccDeleteScreen({super.key});

  @override
  State<AccDeleteScreen> createState() => _AccDeleteScreenState();
}

class _AccDeleteScreenState extends State<AccDeleteScreen> {
  final passController = TextEditingController();
  final _user = FirebaseAuth.instance;
  //
  Future<void> _reauthenticateAndDelete() async {
    try {
      User? user = _user.currentUser;
      String password = passController.text.trim();

      AuthCredential credential = EmailAuthProvider.credential(
        email: user!.email!,
        password: password,
      );

      await user.reauthenticateWithCredential(credential);

      // Delete user data from Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .delete();

      // Delete user account
      await user.delete();

      // Sign out the user
      await _user.signOut();

      // Navigate to the authentication screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Initialscreen()),
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
      // Display error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message ?? 'An error occurred'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete Account"),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: passController,
              decoration:
                  InputDecoration(hintText: 'Enter password to delete account'),
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                _reauthenticateAndDelete();
              },
              child: Text("Delete"),
            )
          ],
        ),
      ),
    );
  }
}
