import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  void Function()? onTap;

  Register({super.key, required this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  void register() async {
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    try{
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        Navigator.of(context).pop();
      } else {
        showErrorMessage("Paswords don't match");
      }
    } on FirebaseAuthException catch (e){
      Navigator.of(context).pop();
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String msg) {
    Navigator.of(context).pop();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(msg),
            ));
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
                obscureText: false,
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
              TextField(
                obscureText: false,
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
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
                onTap: register,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),

              GestureDetector(
                onTap: widget.onTap,
                child: Text("Already have an account?"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
