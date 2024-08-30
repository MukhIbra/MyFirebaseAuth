import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myfb/pages/auth_page.dart';
import 'package:myfb/pages/login.dart';

import 'firebase_options.dart';
import 'pages/home_page.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  

  runApp(const MyApp());
}
// email: test@gmail.com
// password: test123

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
