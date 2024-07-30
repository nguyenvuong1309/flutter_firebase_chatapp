import 'package:flutter_firebase_project/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_project/chat app 2/services/auth_service.dart'; // Ensure the file path is correct
import 'package:get_it/get_it.dart';


// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_chat_app_tutorial/firebase_options.dart'; // Ensure this file is correctly set up
// import 'package:firebase_chat_app_tutorial/services/auth_service.dart'; // Ensure the file path is correct
// import 'package:get_it/get_it.dart';


Future<void> setupFirebase() async {
	//if (Firebase.apps.isEmpty) {
	  await Firebase.initializeApp(
	  	options: DefaultFirebaseOptions.currentPlatform,
	  );
	//}
}

Future<void> registerServices() async {
  final GetIt getIt = GetIt.instance;
  getIt.registerSingleton<AuthService>(
    AuthService(),
  );
}