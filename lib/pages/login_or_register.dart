import 'package:flutter/material.dart';
import 'package:myfb/pages/register.dart';

import 'login.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool isLoginPage = true;

  void switchPages() {
    setState(() {
      isLoginPage = !isLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoginPage) return Login(onTap: switchPages);
    else return Register(onTap: switchPages);
  }
}
