import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var currUser = FirebaseAuth.instance.currentUser!;

  void logout() async{
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: logout,
          )
        ],
      ),
      body: Center(
        child: Text('Hello, ' + currUser.email!),
      ),
    );
  }
}
