import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:myfb/services/auth_service.dart';

class Login extends StatefulWidget {
  void Function()? onTap;

  Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  void loginWithGoogle(){

  }
  void login() async {
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    // try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.of(context).pop();
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == "user-not-found") {
    //     Navigator.pop(context);
    //     wrongEmail();
    //   } else if (e.code == "wrong-password") {
    //     Navigator.pop(context);
    //     wrongPassword();
    //   }
    // }
  }

  void wrongPassword() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Wrong Password'),
      ),
    );
  }

  void wrongEmail() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Wrong Email'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                ),
              ),
              SizedBox(height: 25),
              GestureDetector(
                onTap: login,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),

              GestureDetector(
                onTap: widget.onTap,
                child: Text("Not have an account?"),
              ),

              SizedBox(height: 100),
              GestureDetector(
                onTap: () =>  AuthService().signInWithGoogle(),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Image.asset('lib/assets/img.png'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
