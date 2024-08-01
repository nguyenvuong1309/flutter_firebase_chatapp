import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_project/chat%20app%202/services/alert_service.dart';
import 'package:flutter_firebase_project/chat%20app%202/services/database_service.dart';
import 'package:flutter_firebase_project/chat%20app%202/services/media_service.dart';
import 'package:flutter_firebase_project/chat%20app%202/services/storage_service.dart';
import 'package:get_it/get_it.dart';

import '../consts.dart';
import '../models/user_profile.dart';
import '../services/auth_service.dart';
import '../services/navigation_service.dart';
import '../widgets/custom_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GetIt _getIt = GetIt.instance;
  late MediaService _mediaService;
  final GlobalKey<FormState> _registerFormKey = GlobalKey();
  late AuthService _authService;
  late NavigationService _navigationService;
  late StorageService _storageService;
  late DatabaseService _databaseService;
  late AlertService _alertService;

  File? selectedImage;
  String? email, password, name;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _navigationService = _getIt.get<NavigationService>();
    _mediaService = _getIt.get<MediaService>();
    _authService = _getIt.get<AuthService>();
    _storageService = _getIt.get<StorageService>();
    _databaseService = _getIt.get<DatabaseService>();
    _alertService = _getIt.get<AlertService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20.0, // EdgeInsets.symmetric
        ),
        child: Column(
          children: [
            _headerText(),
            if (!isLoading) _registerForm(),
            if (!isLoading) _loginAccountLink(),
            if (isLoading)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ), // Center
              ) // Expanded
          ], // Column  // Padding
        ), // SafeArea
      ),
    );
  }

  Widget _headerText() {
    return SizedBox(
      width:
          MediaQuery.of(context).size.width, // Sử dụng MediaQuery.of(context)
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Let's get started!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            "Register a new account",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/logo_LuxOasis.png',
              height: 80,
              width: 300,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _registerForm() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.60,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.05,
      ), // EdgeInsets.symmetric
      child: Form(
        key: _registerFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _pfpSelectionFiled(),
            CustomFormField(
              hintText: "Name",
              height: MediaQuery.sizeOf(context).height * 0.1,
              validationRegEx: NAME_VALIDATION_REGEX,
              onSaved: (value) {
                setState(
                  () {
                    name = value;
                  },
                );
              },
            ), // CustomFormField
            CustomFormField(
              hintText: "Email",
              height: MediaQuery.sizeOf(context).height * 0.1,
              validationRegEx: EMAIL_VALIDATION_REGEX,
              onSaved: (value) {
                setState(
                  () {
                    email = value;
                  },
                );
              },
            ), // CustomFormField
            CustomFormField(
              hintText: "Password",
              height: MediaQuery.sizeOf(context).height * 0.1,
              validationRegEx: PASSWORD_VALIDATION_REGEX,
              onSaved: (value) {
                setState(
                  () {
                    password = value;
                  },
                );
              },
            ), // CustomFormField
            _registerButton()
          ],
        ), // Column
      ), // Form
    ); // Container
  }

  Widget _pfpSelectionFiled() {
    return GestureDetector(
        onTap: () async {
          File? file = await _mediaService.getImageFromGallery();
          if (file != null) {
            setState(() {
              selectedImage = file;
            });
          }
        },
        child: CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.15,
          backgroundImage: selectedImage != null
              ? FileImage(selectedImage!)
              : NetworkImage(PLACEHOLDER_PFP) as ImageProvider,
        ) // CircleAvatar
        );
  }

  Widget _registerButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        color: Color(0xFF2F7682), //Theme.of(context).colorScheme.primary,
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          try {
            if ((_registerFormKey.currentState?.validate() ?? false) &&
                selectedImage != null) {
              _registerFormKey.currentState?.save();
              bool result = await _authService.signup(email!, password!);
              if (result) {
                String? pfpURL = await _storageService.uploadUserPfp(
                  file: selectedImage!,
                  uid: _authService.user!.uid,
                );
                if (pfpURL != null) {
                  await _databaseService.createUserProfile(
                    userProfile: UserProfile(
                        uid: _authService.user!.uid,
                        name: name,
                        pfpURL: pfpURL), // UserProfile
                  );
                  _alertService.showToast(
                    text: "User registered successfully!",
                    icon: Icons.check,
                  );
                  _navigationService.goBack();
                  _navigationService.pushReplacementNamed("/home");
                } else {
                  throw Exception("Unable to upload user profile");
                }
              } else {
                throw Exception("Unable to register user");
              }
            }
          } catch (e) {
            print(e);
            _alertService.showToast(
              text: "Failed to register, Please try again!",
              icon: Icons.error,
            );
          }
          setState(() {
            isLoading = false;
          });
        },
        child: const Text(
          "Register",
          style: TextStyle(
            color: Colors.white,
          ), // TextStyle
        ), // Text
      ), // MaterialButton
    ); // SizedBox
  }

  Widget _loginAccountLink() {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text("Already have an account? "),
          GestureDetector(
            onTap: () {
              _navigationService.goBack();
            },
            child: const Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.w800,
              ), // TextStyle ), // Text
            ),
          )
        ],
      ),
    );
  }
}
