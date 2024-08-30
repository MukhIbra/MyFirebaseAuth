import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfb/pages/home_page.dart';
import 'package:myfb/pages/login_or_register.dart';

import 'login.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return HomePage();
          }else{
            return LoginOrRegister();
          }
        },

      ),
    );
  }
}
