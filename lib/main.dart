import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chatapp/app/routes/pages.dart';
import 'package:flutter_firebase_chatapp/common/models/user.dart';
import 'package:flutter_firebase_chatapp/firebase_options.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/store/config.dart';
import 'common/services/StorageService.dart';






void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put<ConfigStore>(ConfigStore());
  Get.put<UserStore>(UserStore());
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
const MyApp({super.key});
  @override
Widget build(BuildContext context) {
return ScreenUtilInit( 
  builder: (BuildContext context, Widget? child) =>
        GetMaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // home: Center(child: Container(child: Text("Vuong")))
    )
  );
  }
}




// void main() Color.fromARGB(255, 58, 67, 75)   await setup();
//   runApp(MyApp());
// }

// Future<void> setup() async {
//   try {
//     WidgetsFlutterBinding.ensureInitialized();
//     await setupFirebase();
//   }catch(e){
//     print("🚀 ~ Future<void>setup ~ e:");
//   }
//   await registerServices();
// }

// class MyApp extends StatelessWidget {
//   final GetIt _getIt = GetIt.instance;

//   late NavigationService _navigationService;
//   late AuthService _authService;

//   MyApp({super.key}) {
//     _navigationService = _getIt.get<NavigationService>();
//     _authService = _getIt.get<AuthService>();
//   }

//   // const MyApp({super.key});
//   @override
//   Widget build (BuildContext context) {
//     return MaterialApp (
//       navigatorKey: _navigationService.navigatorKey,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//         textTheme: GoogleFonts.montserratTextTheme(),
//         ), // ThemeData
//       initialRoute: _authService.user != null ? "/home" : "/login",
//       routes: _navigationService.routes,
//     ); // MaterialApp further ubet l'd like to do is open th
//   }
// }




