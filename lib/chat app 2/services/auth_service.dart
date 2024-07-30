import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

	User? _user;

	User? get user{
		return _user;
	}

  AuthService();

  Future<bool> login(String email, String password) async {
    try {
      UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        // Assuming you might want to do something with the user object
				_user = credential.user;
        return true;
      }
    } catch (e) {
      print("Login failed: $e");
      return false;
    }
    return false;
  }
}
