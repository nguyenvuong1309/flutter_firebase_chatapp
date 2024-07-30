import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_project/Login%20Signup/Screen/home_screen.dart';
import 'Real Time Database/query_in_realtime.dart';
import 'Chat App/chat_page.dart';
import '../Chat App/login.dart';

Future<void> main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Run your app
  runApp(MyApp()); // Remove const here
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeeScreen(), // No need for const here
    );
  }
}
// Before start the video setup your project with firebase
// If you have any problem to setup then firebase setup video is in i button and description