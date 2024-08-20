import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_it/get_it.dart';
// import 'Chat App/chat_page.dart';
// import '../Chat App/login.dart';
import '../chat app 2/utils/utils.dart';
// import '../chat app 2/pages/login_page.dart';
import '../chat app 2/services/navigation_service.dart';
import '../chat app 2/services/auth_service.dart';




void main() async {
  await setup();
  runApp(MyApp());
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
  final GetIt _getIt = GetIt.instance;

  late NavigationService _navigationService;
  late AuthService _authService;

  MyApp({super.key}) {
    _navigationService = _getIt.get<NavigationService>();
    _authService = _getIt.get<AuthService>();
  }

  // const MyApp({super.key});
  @override
  Widget build (BuildContext context) {
    return MaterialApp (
      navigatorKey: _navigationService.navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme(),
        ), // ThemeData
      initialRoute: _authService.user != null ? "/home" : "/login",
      routes: _navigationService.routes,
    ); // MaterialApp further ubet l'd like to do is open th
  }
}

