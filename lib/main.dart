import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_project/Login%20Signup/Screen/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Real Time Database/query_in_realtime.dart';
import 'Chat App/chat_page.dart';
import '../Chat App/login.dart';
import '../chat app 2/utils/utils.dart';
import '../chat app 2/pages/login_page.dart';



void main() async {
  await setup();
  runApp(const MyApp());
}

Future<void> setup() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await setupFirebase();
  }catch(e){
    print("🚀 ~ Future<void>setup ~ e:");
  }
  await registerServices();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build (BuildContext context) {
    return MaterialApp (
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme(),
        ), // ThemeData
      home: LoginPage(),
    ); // MaterialApp further ubet l'd like to do is open th
  }
}

