import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jobstreet/firebase_options.dart';
import 'package:jobstreet/main_Controller.dart';

import 'Login_Page/screen/first_screen.dart';
import 'Login_Page/screen/signin_screen.dart';
import 'Login_Page/screen/singup_screen.dart';
import 'Login_Page/splash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: SplashScreen()
      //SplashScreen()

    );

  }

}
